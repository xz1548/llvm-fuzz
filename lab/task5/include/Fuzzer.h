#include <iostream>
#include <cstring>

using namespace std;

#ifndef FUZZER_H
#define FUZZER_H

class CFuzzer
{
    private:
        
        void UpdateCoverMap();
        void AddToQueue();
        void FuzzOne();
    public:
        void ParsingArgs(int argc, char **argv);
        void DryRun();
        void FuzzCycle();
};

#endif // FUZZER_H