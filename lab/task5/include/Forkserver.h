#include <sys/resource.h>
#include <unistd.h>
#include <cstdint>
#include <fcntl.h>
#include <sys/wait.h>
#include <sys/time.h>
#include "Header.h"
#include "Helper.h"
#include "SHM.h"

using namespace std;

#ifndef FORKSERVER_H
#define FORKSERVER_H

enum RtCode {
    RUN_EXIT,   // 0 for exit with a code
    RUN_CRASH,  // 1 for terminated with a signal
    RUN_FAIL,   // 2 for execv error
    RUN_TMOUT   // 3 for timeout
};

class CForkserver {
    private:
        CHelper forkserver_helper;
        CSHM *forkserver_shm;
        int st_pipe[2];
        int ctl_pipe[2];
        int timeout_status = 0;
        pid_t forksrv_pid;
        pid_t child_pid;
        uint32_t fsrv_ctl_fd; /* Fork server control pipe (write) */
        uint32_t fsrv_st_fd;  /* Fork server status pipe (read)   */
        void kill_child(int sig);
    public:
        CForkserver(CHelper helper, CSHM *shm);
        ~CForkserver();
        void StartForkserver();
        uint8_t RunTarget();
};

#endif // FORKSERVER_H