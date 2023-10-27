#include "Forkserver.h"

CForkserver::CForkserver(CHelper helper, CSHM *shm) {
    forkserver_helper = helper;
    forkserver_shm = shm;
}

CForkserver::~CForkserver() {
    close(ctl_pipe[0]);
    close(ctl_pipe[1]);
    close(st_pipe[0]);
    close(st_pipe[1]);
}

void CForkserver::StartForkserver() {
    int status;
    if(pipe(st_pipe) || pipe(ctl_pipe)) {
        std::cout << "[" << RED << "Error" << RESET << "]";
        std::cout << "pipe failed" << std::endl;
        exit(1);
    }

    forksrv_pid = fork();
    if(forksrv_pid < 0) {
        std::cout << "[" << RED << "Error" << RESET << "]";
        std::cout << "Fork failed" << std::endl;
        exit(1);
    }

    if(!forksrv_pid) {
        struct rlimit r;
        if(!getrlimit(RLIMIT_NOFILE, &r) && r.rlim_cur < FORKSRV_FD + 2) {
            r.rlim_cur = FORKSRV_FD + 2;
            if(setrlimit(RLIMIT_NOFILE, &r)) {
                std::cout << "[" << YELLOW << "Warning" << RESET << "]";
                std::cout << "Ignoring setrlimit failed" << std::endl;
                // exit(1);
            }
        }

        r.rlim_max = r.rlim_cur = 0;
        setrlimit(RLIMIT_CORE, &r);

        setsid();

        if(dup2(ctl_pipe[0], FORKSRV_FD) < 0) {
            std::cout << "[" << RED << "Error" << RESET << "]";
            std::cout << "dup2 failed" << std::endl;
            exit(1);
        }
        if(dup2(st_pipe[1], FORKSRV_FD + 1) < 0) {
            std::cout << "[" << RED << "Error" << RESET << "]";
            std::cout << "dup2 failed" << std::endl;
            exit(1);
        }

        int devnull = open("/dev/null", O_WRONLY);
        dup2(devnull, 0);
        dup2(devnull, 1);
        dup2(devnull, 2);

        close(ctl_pipe[0]);
        close(ctl_pipe[1]);
        close(st_pipe[0]);
        close(st_pipe[1]);

        close(devnull);

        if (!getenv("LD_BIND_LAZY")) setenv("LD_BIND_NOW", "1", 0);
        setenv("ASAN_OPTIONS", "abort_on_error=1:"
                           "detect_leaks=0:"
                           "symbolize=0:"
                           "allocator_may_return_null=1", 0);
        
        execv(forkserver_helper.GetRunCmd()[0].c_str(), (char **)forkserver_helper.GetRunCmd().data());

        forkserver_shm->Set32SHMPtr(EXEC_FAIL_SIG);
        exit(0);
    }

    std::cout << "[" << BLUE << "Info" << RESET << "]";
    std::cout << "Forkserver pid: " << forksrv_pid << std::endl;

    close(ctl_pipe[0]);
    close(st_pipe[1]);

    fsrv_ctl_fd = ctl_pipe[1];
    fsrv_st_fd = st_pipe[0];

    uint32_t rlen = read(fsrv_st_fd, &status, 4);
    if(rlen != 4) {
        std::cout << "[" << RED << "Error" << RESET << "]";
        std::cout << "Forkserver read st failed" << std::endl;
        // exit(1);
    } else {
        std::cout << "[" << BLUE << "Info" << RESET << "]";
        std::cout << "Forkserver status: " << status << std::endl;
        return;
    }

    if (waitpid(forksrv_pid, &status, 0) <= 0) {
        std::cout << "[" << RED << "Error" << RESET << "]";
        std::cout << "waitpid() failed\n";
        exit(1);
    }

    if (WIFSIGNALED(status)) {
        std::cout << "[" << RED << "Error" << RESET << "]";
        std::cout << "Fork server crashed with signal " << strsignal(WTERMSIG(status)) << std::endl;
        exit(1);
    }

    if (*(uint32_t *)forkserver_shm->GetSHMPtr() == EXEC_FAIL_SIG) {
        std::cout << "[" << RED << "Error" << RESET << "]";
        std::cout << "Fork server execv failed" << std::endl;
        exit(1);
    }
}

void CForkserver::kill_child(int sig) {
    if(!child_pid) return;

    kill(child_pid, SIGKILL);
    timeout_status = 1;
}

uint8_t CForkserver::RunTarget() {
    uint32_t res;

    memset(forkserver_shm->GetSHMPtr(), 0, MAP_SIZE);

    uint32_t buf = 0x12345678;
    res = write(fsrv_ctl_fd, &buf, 4);

    if(res != 4) {
        std::cout << "[" << RED << "Error" << RESET << "]";
        std::cout << "RunTarget write ctl_pipe failed" << std::endl;
    }

    res = read(fsrv_st_fd, &child_pid, 4);
    if(res != 4) {
        std::cout << "[" << RED << "Error" << RESET << "]";
        std::cout << "RunTarget read st_pipe failed" << std::endl;
    }

    if(child_pid <= 0) {
        std::cout << "[" << RED << "Error" << RESET << "]";
        std::cout << "Forkserver send wrong child_pid" << std::endl;
        exit(1);
    }

    timeout_status = 0;
    signal(SIGALRM, (void (*)(int)) &CForkserver::kill_child);

    struct itimerval timer;
    timer.it_value.tv_sec = TMOUT_SEC;
    timer.it_value.tv_usec = TMOUT_USEC;
    timer.it_interval.tv_sec = 0;
    timer.it_interval.tv_usec = 0;
    setitimer(ITIMER_REAL, &timer, NULL);

    uint32_t status;
    res = read(fsrv_st_fd, &status, 4);
    if(res != 4) {
        std::cout << "[" << RED << "Error" << RESET << "]";
        std::cout << "RunTarget read st_pipe failed" << std::endl;
        exit(1);
    }

    timer.it_value.tv_sec = 0;
    timer.it_value.tv_usec = 0;
    setitimer(ITIMER_REAL, &timer, NULL);

    if(timeout_status == 1) {
        std::cout << "[" << YELLOW << "Warning" << RESET << "]";
        std::cout << "Killed child process by timeout" << std::endl;
        return RUN_TMOUT;
    }

    if(WIFEXITED(status)) {
        int exit_status = WEXITSTATUS(status);
        std::cout << "[" << BLUE << "Info" << RESET << "]";
        std::cout << "Child process exited with status " << exit_status << std::endl;
        return RUN_EXIT;
    } else if(WIFSIGNALED(status)) {
        int signal_status = WTERMSIG(status);
        std::cout << "[" << BLUE << "Info" << RESET << "]";
        std::cout << "Child process terminated with signal " << strsignal(signal_status) << std::endl;
        return RUN_CRASH;
    } else {
        std::cout << "[" << RED << "Error" << RESET << "]";
        std::cout << "Child process terminated with unknown status" << std::endl;
        return RUN_FAIL;
    }
}