#include "Helper.h"

void CHelper::ParsingArgs(int argc, char **argv) {
    for(auto i = 1; i < argc; i++) {
        if(strcmp(argv[i], "-i") == 0) {
            i++;
            infolder = std::string(argv[i]);
        } else if(strcmp(argv[i], "-o") == 0) {
            i++;
            outfolder = std::string(argv[i]);
        } else {
            run_cmd.push_back(std::string(argv[i]));
        }
    }
    if(infolder.empty() || outfolder.empty() || run_cmd.empty()) {
        std::cout << "[" << RED << "Error" << RESET << "]";
        std::cout << "Usage: " << argv[0] << " -i <input folder> -o <output folder> <command>" << std::endl;
        exit(0);
    }
    if(run_cmd.empty()) {
        std::cout << "[" << RED << "Error" << RESET << "]";
        std::cout << "Need Input Command Or File" << std::endl;
        exit(0);
    }
    for(auto &arg : run_cmd) {
        if(arg == "@@") {
            arg = outfolder + "/.temp_in";
        }
    }
}

void CHelper::InitOutFolder() {
    if(outfolder.back() == '/') {
        crash_folder = outfolder + "crashes/";
    } else {
        crash_folder = outfolder + "/crashes/";
    }
    try {
        if(std::filesystem::create_directory(crash_folder)) {
            std::cout << "[" << GREEN << "Successful" << RESET << "]";
            std::cout << "Create Directory: " << crash_folder << std::endl;
        } else {
            std::cout << "[" << YELLOW << "Warning" << RESET << "]";
            std::cout << "Directory: " << crash_folder << " Already Exists" << std::endl;
        }
    } catch (std::filesystem::filesystem_error &e){
        std::cout << "[" << RED << "Error" << RESET << "]";
        std::cout << "Create Directory: " << crash_folder << " Failed" << std::endl;
        exit(0);
    }

    queue_folder = outfolder + "queue/";
    try {
        if(std::filesystem::create_directory(queue_folder)) {
            std::cout << "[" << GREEN << "Successful" << RESET << "]";
            std::cout << "Create Directory: " << queue_folder << std::endl;
        } else {
            std::cout << "[" << YELLOW << "Warning" << RESET << "]";
            std::cout << "Directory: " << queue_folder << " Already Exists" << std::endl;
        }
    } catch (std::filesystem::filesystem_error &e){
        std::cout << "[" << RED << "Error" << RESET << "]";
        std::cout << "Create Directory: " << queue_folder << " Failed" << std::endl;
        exit(0);
    }

    timeout_folder = outfolder + "timeout/";
    try {
        if(std::filesystem::create_directory(timeout_folder)) {
            std::cout << "[" << GREEN << "Successful" << RESET << "]";
            std::cout << "Create Directory: " << timeout_folder << std::endl;
        } else {
            std::cout << "[" << YELLOW << "Warning" << RESET << "]";
            std::cout << "Directory: " << timeout_folder << " Already Exists" << std::endl;
        }
    } catch (std::filesystem::filesystem_error &e){
        std::cout << "[" << RED << "Error" << RESET << "]";
        std::cout << "Create Directory: " << timeout_folder << " Failed" << std::endl;
        exit(0);
    }
}

void CHelper::WriteIntoFile(std::string filepath, uint8_t *data, size_t size) {
    ofstream file(filepath, ios::binary);
    if(file.is_open()) {
        file.write((char *)data, size);
        file.close();
    } else {
        std::cout << "[" << RED << "Error" << RESET << "]";
        std::cout << "Open File: " << filepath << " Failed" << std::endl;
        exit(0);
    }
}

bool CHelper::HandleCrash(CSHM *shm) {
    uint8_t res = false;
    for(auto i = 0; i < MAP_SIZE; i++) {
        if(crash_map[i] == false && shm->GetSHMPtr()[i] > 0) {
            crash_map[i] = true;
            res = true;
        }
        if(crash_always_map[i] == true && shm->GetSHMPtr()[i] == 0) {
            crash_always_map[i] = false;
            res = true;
        }
    }
    return res;
}

std::vector<std::string> CHelper::GetRunCmd() {
    return run_cmd;
}

// void CHelper::UpdateLogFile() {

// }