#include <stdint.h>
#include <iostream>
#include <unistd.h>

#include <sys/wait.h>
#include <fcntl.h>
#include <fstream>

#include <sys/ipc.h>
#include <sys/shm.h>

typedef uint8_t u8;
typedef uint32_t u32;

int main() {
    int pipefd[2];
    pipe(pipefd); // 创建管道

    pid_t pid = fork(); // 创建子进程
    if (pid == 0) { // 子进程
        close(pipefd[1]); // 关闭写端
        dup2(pipefd[0], STDIN_FILENO); // 将标准输入重定向到管道读端

        execl("../build/res", "res", (char*) NULL);
        // 如果execl返回，那么就出错了
        std::cerr << "execl failed\n";
        return 1;
    } else if (pid > 0) { // 父进程
        close(pipefd[0]); // 关闭读端

        // 打开文件并写入管道
        std::ifstream file("input.txt");
        if (file.is_open()) {
            std::string line;
            while (getline(file, line)) {
                write(pipefd[1], line.c_str(), line.size());
                write(pipefd[1], "\n", 1);
            }
            file.close();
        }

        close(pipefd[1]); // 关闭写端
        wait(NULL); // 等待子进程结束
    } else { // fork失败
        std::cerr << "fork failed\n";
        return 1;
    }

    key_t key = ftok("shmfile", 65); 

    int shmid = shmget(key, 1<<16, 0666);

    u8* shared_mem_ptr = (u8*) shmat(shmid, (void*)0, 0);

    for (int i = 0; i < 1<<16; i++) {
        if (shared_mem_ptr[i] != 0){
            printf("%d is %d\n", i, shared_mem_ptr[i]);
        }    
    }

    shmdt(shared_mem_ptr);
    

    return 0;
}
