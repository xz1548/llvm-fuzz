#include <unistd.h>
#include <sys/shm.h>
#include <cstdint>
#include <cstdlib>
#include "Helper.h"

using namespace std;

#ifndef SHM_H
#define SHM_H

class CSHM {
    private:
        const char* shm_name_set = getenv("FUZZ_SHM_NAME");
        key_t key;
        int shmid;
        uint8_t *shared_mem_ptr = NULL;
    public:
        void SetupSHM();

        uint8_t *GetSHMPtr();
};

#endif // SHM_H