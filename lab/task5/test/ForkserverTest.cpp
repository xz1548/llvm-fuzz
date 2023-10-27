#include "Forkserver.h"

int main(int argc, char **argv) {
    CHelper helper;
    helper.ParsingArgs(argc, argv);
    helper.InitOutFolder();

    CSHM *shm = new CSHM();
    shm->SetupSHM();

    CForkserver forkserver(helper, shm);
    forkserver.StartForkserver();
    while(1) {
        forkserver.RunTarget();
    }

    return 0;
}