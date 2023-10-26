#include <unistd.h>
#include <sys/shm.h>

using namespace std;

#ifndef SHM_H
#define SHM_H

class CSHM {
    private:
        uint8_t *shared_mem_ptr = NULL;;
    public:
        void SetupSHM();

        uint8_t *GetSHMPtr() {
            return shared_mem_ptr;
        }
};

#endif // SHM_H