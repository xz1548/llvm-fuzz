#include <filesystem>
#include <iostream>
#include <fstream>
#include <cstring>
#include <vector>
#include <cstdint>
#include "SHM.h"
#include "Header.h"

using namespace std;

#ifndef HELPER_H
#define HELPER_H

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
            std::vector<std::string> GetRunCmd();
            // void UpdateLogFile();
        
};

#endif // HELPER_H