#include <sys/resource.h>
#include <unistd.h>
#include <cstdint>
#include <sys/wait.h>
#include "Helper.h"

using namespace std;

#ifndef FORKSERVER_H
#define FORKSERVER_H

#define FORKSRV_FD 198
#define EXEC_FAIL_SIG 0xfee1dead

class CForkserver {
    private:
        CHelper forkserver_helper;
        int st_pipe[2];
        int ctl_pipe[2];
        int status;
        pid_t forksrv_pid;
        uint32_t fsrv_ctl_fd; /* Fork server control pipe (write) */
        uint32_t fsrv_st_fd;  /* Fork server status pipe (read)   */
    public:
        CForkserver(CHelper helper);
        ~CForkserver();
        void StartForkserver();
};

#endif // FORKSERVER_H