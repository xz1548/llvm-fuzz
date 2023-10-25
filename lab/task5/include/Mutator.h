#include <iostream>
#include <cstring>
#include <cstdint>

using namespace std;

#ifndef MUTATOR_H
#define MUTATOR_H

class CMutator
{
    private:
        
        uint32_t ChooseBlockLen();
    public:
        void Mutate();
        void HandleMutation();
};

#endif // MUTATOR_H
