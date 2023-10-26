#include <filesystem>
#include <iostream>
#include <fstream>
#include <cstring>
#include <vector>
#include <cstdint>
#include "SHM.h"

using namespace std;

#ifndef HELPER_H
#define HELPER_H

#define MAP_SIZE (1 << 16)

/* Define Some Color For Output*/
#define RESET   "\x1B[0m"
#define RED     "\x1B[31m"
#define GREEN   "\x1B[32m"
#define YELLOW  "\x1B[33m"
#define BLUE    "\x1B[34m"

class CHelper {
    private:
            std::string infolder;
            std::string outfolder;
            std::vector<std::string> run_cmd;
            std::string crash_folder;
            std::string timeout_folder;
            std::string queue_folder;
            std::vector<bool> crash_map = std::vector<bool>(MAP_SIZE, false);
            std::vector<bool> crash_always_map = std::vector<bool>(MAP_SIZE, true);
        public:
            void ParsingArgs(int argc, char **argv);
            void InitOutFolder();
            void WriteIntoFile(std::string filepath, uint8_t *data, size_t size);
            bool HandleCrash(CSHM *shm);
            // void UpdateLogFile();
        
};

#endif // HELPER_H