#include "Forkserver.h"

CForkserver::CForkserver(CHelper helper) {
    forkserver_helper = helper;
}

CForkserver::~CForkserver() {
    close(ctl_pipe[0]);
    close(ctl_pipe[1]);
    close(st_pipe[0]);
    close(st_pipe[1]);
}

void CForkserver::StartForkserver() {
    if(pipe(st_pipe) || pipe(ctl_pipe)) {
        std::cout << "[" << RED << "Error" << RESET << "]";
        std::cout << "pipe failed" << std::endl;
        exit(1);
    }

    forksrv_pid = fork();
    if(forksrv_pid < 0) {
        std::cout << "[" << RED << "Error" << RESET << "]";
        std::cout << "fork failed" << std::endl;
        exit(1);
    }

    if(!forksrv_pid) {
        struct rlimit r;
        if(!r.getrlimit(RLIMIT_NOFILE, &r) && r.rlim_cur < FORKSERVER_FD + 2) {
            r.rlim_cur = FORKSERVER_FD + 2;
            if(r.setrlimit(RLIMIT_NOFILE, &r)) {
                std::cout << "[" << YELLOW << "Warning" << RESET << "]";
                std::cout << "ignoring setrlimit failed" << std::endl;
                // exit(1);
            }
        }

        r.rlim_max = r.rlim_cur = 0;
        serlimit(RLIMIT_CORE, &r);

        setsid();

        if(dup2(ctl_pipe[0], FORKSERVER_FD) < 0) {
            std::cout << "[" << RED << "Error" << RESET << "]";
            std::cout << "dup2 failed" << std::endl;
            exit(1);
        }
        if(dup2(st_pipe[1], FORKSERVER_FD + 1) < 0) {
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
        
        // execv(helper.run_command[0], helper.run_command.data());

        *(u32*)shared_mem_ptr = EXEC_FAIL_SIG;
        exit(0);
    }

    std::cout << "[" << BLUE << "Info" << RESET << "]";
    std::cout << "forkserver pid: " << forksrv_pid << std::endl;

    close(ctl_pipe[0]);
    close(st_pipe[1]);

    fsrv_ctl_fd = ctl_pipe[1];
    fsrv_st_fd = st_pipe[0];

    uint32_t rlen = read(fsrv_st_fd, &status, 4);
    if(rlen != 4) {
        std::cout << "[" << RED << "Error" << RESET << "]";
        std::cout << "read failed" << std::endl;
        exit(1);
    } else {
        std::cout << "[" << BLUE << "Info" << RESET << "]";
        std::cout << "forkserver status: " << status << std::endl;
    }

    if (waitpid(forksrv_pid, &status, 0) <= 0) {
        std::cout << "waitpid() failed\n";
        exit(1);
    }

    if (WIFSIGNALED(status) && !WEXITSTATUS(status)) {
        std::cout << "[" << RED << "Error" << RESET << "]";
        std::cout << "Fork server crashed with signal " << strsignal(WTERMSIG(status)) << std::endl;
        exit(1);
    }

    if (WEXITSTATUS(status)) {
        std::cout << "[" << RED << "Error" << RESET << "]";
        std::cout << "Fork server exited with status " << strsignal(WEXITSTATUS(status)) << std::endl;
        exit(1);
    }
}