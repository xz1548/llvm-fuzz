#include <vector>
#include <string>

using namespace std;

#ifndef CLANG_WRAPPER_H
#define CLANG_WRAPPER_H

class CClangWrapper {
    public:
		std::string clang_upstream = "/home/kali/Desktop/clang+llvm-11.1.0-x86_64-linux-gnu-ubuntu-20.10/bin/clang";
		std::string clangxx_upstream = "/home/kali/Desktop/clang+llvm-11.1.0-x86_64-linux-gnu-ubuntu-20.10/bin/clang++";
		std::string llc_upstream = "/home/kali/Desktop/clang+llvm-11.1.0-x86_64-linux-gnu-ubuntu-20.10/bin/llc";
		std::string instrument_prog = "/home/kali/Desktop/llvm-fuzz/lab/task4/instrumentation/build/instrumentation";
		std::string shm_def = "/home/kali/Desktop/llvm-fuzz/lab/task4/instrumentation/shm_def.o";
		std::string executable;
        std::vector<std::string> sourceFiles;
        std::vector<std::string> oFiles;
        std::vector<std::string> clangArgs;
        std::vector<std::string> llcArgs;
        std::vector<std::string> ldArgs;
        std::vector<std::string> otherArgs;
        bool isCpp = false;
        bool noLink = false;    // -c noLink
        bool saveLL = false;    // -saveLL save the temp file
        bool onlyPreProcess = false;    // -E run the pre process
        bool ASAN = false;              // -fsanitize=address, open ASAN

        void edit_params(int argc, char **argv);

        int GenerateTempLLFile(const std::string &sourceFile, const std::string &llFile);

		int InsertOnLLFile(const std::string &sourceLLFile, const std::string &outputLLFile);

		int TransLLIntoOFile(const std::string &sourceLLFile, const std::string &outputOFile);
		
		int LinkAllFiles(std::vector<std::string> &oFiles, std::string &executable);

        int LDLink();
};

#endif // CLANG_WRAPPER_H
