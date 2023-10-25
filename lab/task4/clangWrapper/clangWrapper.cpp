#include <cstdlib>
#include <iostream>
#include <cstring>
#include "clangWrapper.h"



void CClangWrapper::edit_params(int argc, char **argv) {
	char *name;
	name = strrchr(argv[0], '/');

	if (!name) {
		name = argv[0];
	} else {
		name++;
	}

	if (std::string(name) == "clangWrapper++") {
		isCpp = true;
	}
	
	for(int i = 1; i < argc; i++) {
		std::string cur(argv[i]);
		size_t len = cur.size();
		
		// input c file
		if (len > 2 && cur.substr(len - 2) == ".c") {
			sourceFiles.push_back(cur);
			continue;
		}

		// input c++ file
		if (len > 4 && cur.substr(len - 4) == ".cpp") {
			sourceFiles.push_back(cur);
			continue;
		}

		// -o executable
		if (len >= 2 && cur == "-o") {
			i++;
			executable = std::string(argv[i]);
			continue;
		}

		// -Ox
		if (len >= 2 && cur.substr(0, 2) == "-O") {
			clangArgs.push_back(cur);
			llcArgs.push_back(cur);
			continue;
		}

		// -lxx
		if (len >= 2 && cur.substr(0, 2) == "-l") {
			ldArgs.push_back(cur);
			continue;
		}

		// -Ixx
		if (len >= 2 && cur.substr(0, 2) == "-I") {
			clangArgs.push_back(cur);
			continue;
		}

		// -Dxx
		if (len >= 2 && cur.substr(0, 2) == "-D") {
			clangArgs.push_back(cur);
			continue;
		}

		// -Wxx
		if (len >=2 && cur.substr(0, 2) == "-W") {
			clangArgs.push_back(cur);
			continue;
		}

		// -std=xxx
		if (len>= 5 && cur.substr(0, 5) == "-std=") {
			clangArgs.push_back(cur);
			continue;
		}

		// -static
		if (len >= 7 && cur == "-static") {
			ldArgs.push_back(cur);
			continue;
		}

		// -g
		if (len >= 2 && cur == "-g") {
			clangArgs.push_back(cur);
			ldArgs.push_back(cur);
			continue;
		}

		// -c
		if (len >= 2 && cur == "-c") {
			noLink = true;
			continue;
		}

		// -pedantic-errors
		if (cur == "-pedantic-errors") {
			clangArgs.push_back(cur);
			continue;
		}

		// -fPIC
		if(len >= 5 && cur == "-fPIC") {
			clangArgs.push_back(cur);
			llcArgs.push_back(cur);
			continue;
		}

		// -E
		if (len >= 2 && cur == "-E") {
			onlyPreProcess = true;
			continue;
		}

		// -saveLL
		if (len >= 7 && cur == "-saveLL") {
			saveLL = true;
			continue;
		}

		// -fsanitize=address
		if (cur == "-fsanitize=address") {
			ASAN = true;
			ldArgs.push_back(cur);
			continue;
		}
	}
}

int CClangWrapper::GenerateTempLLFile(const std::string &sourceFile, const std::string &llFile) {
	std::string cmd = clang_upstream;
	if (isCpp) cmd = clangxx_upstream;
	cmd += " -S -emit-llvm " + sourceFile + " -o " + llFile;
	for (auto &arg : clangArgs) {
		cmd += " " + arg;
	}
	return system(cmd.c_str());
}

int CClangWrapper::InsertOnLLFile(const std::string &sourceLLFile, const std::string &outputLLFile) {
	std::string tempLLFile = sourceLLFile + ".temp.ll";
	if (ASAN) {
		std::string cmd = instrument_prog + " " + sourceLLFile + " " + tempLLFile;
		int insertStatus = system(cmd.c_str());
		if (!(WIFEXITED(insertStatus) && WEXITSTATUS(insertStatus)==0)) return insertStatus;

		cmd = clang_upstream;
		if (isCpp) {
			cmd = clangxx_upstream;
		}

		cmd += " -fsanitize=address -S -emit-llvm -o " + outputLLFile + " " + tempLLFile;
		int sanStatus = system(cmd.c_str());
		if (!(WIFEXITED(sanStatus) && WEXITSTATUS(sanStatus)==0)) return sanStatus;
		// clean temp files
		cmd = "rm " + tempLLFile;
		int cleanStatus = system(cmd.c_str());
		if (!(WIFEXITED(cleanStatus) && WEXITSTATUS(cleanStatus)==0)) return cleanStatus;
	} else {
		std::string cmd = instrument_prog + " " + sourceLLFile + " " + outputLLFile;
		int insertStatus = system(cmd.c_str());
		if (!(WIFEXITED(insertStatus) && WEXITSTATUS(insertStatus)==0)) return insertStatus;

	}
	return 0;
}

int CClangWrapper::TransLLIntoOFile(const std::string &sourceLLFile, const std::string &outputOFile) {
	std::string cmd = llc_upstream;
	cmd += " " + sourceLLFile + " --filetype=obj -o " + outputOFile;
	for (auto &arg : llcArgs) {
		cmd += " " + arg;
	}
	return system(cmd.c_str());
}

int CClangWrapper::LinkAllFiles(std::vector<std::string> &oFiles, std::string &executable) {
	std::string cmd = clang_upstream;
	if (isCpp) cmd = clangxx_upstream;

	for (auto &file : oFiles) {
		cmd += " " + file;
	}
	cmd += " -o " + executable;

	for (auto &arg : ldArgs) {
		cmd += " " + arg;
	}

	return system(cmd.c_str());
}

int main(int argc, char **argv) {
	CClangWrapper *cw = new CClangWrapper();
	cw->edit_params(argc, argv);
	for (auto &sourceFile : cw->sourceFiles) {
		cw->GenerateTempLLFile(sourceFile, sourceFile + ".ll");
		cw->InsertOnLLFile(sourceFile + ".ll", sourceFile + ".inst.ll");
		cw->TransLLIntoOFile(sourceFile + ".inst.ll", sourceFile + ".o");
		if (!cw->saveLL) {
			std::string cmd = "rm";
			cmd += " " + sourceFile + ".ll " + sourceFile + ".inst.ll ";
			system(cmd.c_str());
		}
		cw->oFiles.push_back(sourceFile + ".o");
	}
	cw->oFiles.push_back(cw->shm_def);
	cw->LinkAllFiles(cw->oFiles, cw->executable);
	return 0;
}
