#include <unistd.h>
#include <sys/shm.h>

using namespace std;

#ifndef SHM_H
#define SHM_H

class CSHM {
    private:

    public:
        void SetupSHM();
};

#endif // SHM_H