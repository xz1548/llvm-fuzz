#include "SHM.h"

void CSHM::SetupSHM()
{
    if(shm_name_set) {
        key = ftok(shm_name_set, 66 | IPC_CREAT); 
    } else {
        key = ftok("shmfile", 66 | IPC_CREAT);
    }
    int shmid = shmget(key, MAP_SIZE, 0666 | IPC_CREAT);
    if(shmid == -1) {
        std::cout << "[" << RED <<  "Error" << RESET << "] ";
        std::cout << "shmget failed" << std::endl;
        exit(1);
    }
    shared_mem_ptr = (uint8_t *)shmat(shmid, (void *)0, 0);
    if(!shared_mem_ptr) {
        std::cout << "[" << RED <<  "Error" << RESET << "] ";
        std::cout << "shmat failed" << std::endl;
        exit(1);
    }
}

uint8_t *CSHM::GetSHMPtr()
{
    return shared_mem_ptr;
}