#include <sys/ipc.h>
#include <sys/shm.h>
#include <inttypes.h>
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>
#include <sys/wait.h>

typedef uint8_t u8;
typedef uint32_t u32;
typedef int32_t s32;

u8* __area_ptr;
__thread u32 __prev_loc = 0;

void setup_shared_memory() {
	const char* shm_name_set = getenv("FUZZ_SHM_NAME");
	key_t key;

	if (shm_name_set) key = ftok(shm_name_set, 66);
	else key = ftok("shmfile", 66);

	int shmid = shmget(key, 1<<16, 0666|IPC_CREAT);
	if (shmid == -1) {
        printf("error: can't get shm\n");
        exit(1);
    }

	__area_ptr = (u8*) shmat(shmid, (void*)0, 0);
	if (!__area_ptr) {
        printf("error: shmat returns NULL\n");
        exit(1);
    }
}
