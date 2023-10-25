#include <filesystem>
#include <iostream>
#include <fstream>
#include <cstring>

using namespace std;

#ifndef HELPER_H
#define HELPER_H

class CHelper {
    private:
        std::string infolder;
        std::string outfolder;
    public:
        void ParsingArgs(int argc, char **argv);
        void InitOutFolder();
        void ReadTestCases();
        void WriteIntoFile();
        void HandleCrash();
        void UpdateLogFile();
        
};

#endif // HELPER_H