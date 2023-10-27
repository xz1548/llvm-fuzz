#include <iostream>
#include <cstring>
#include <cstdint>
#include "Helper.h"
#include "Fuzzer.h"

using namespace std;

#ifndef MUTATOR_H
#define MUTATOR_H

class CMutator
{
    private:
        uint8_t *mut_buf;
        uint32_t mut_len;
        uint32_t ChooseBlockLen();
        void BitFlip();
        void ArithmeticInc();
        void InterestingValues();
        void RandomHavoc();
    public:
        CMutator(uint8_t *buf, uint32_t len);
        ~CMutator();
        void Mutate();
        void HandleMutation();
};

#endif // MUTATOR_H
