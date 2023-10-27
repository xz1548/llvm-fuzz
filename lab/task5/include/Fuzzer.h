#include <iostream>
#include <cstring>
#include <cstdint>
#include "Helper.h"

using namespace std;

#ifndef FUZZER_H
#define FUZZER_H

struct queue_entry {
    std::string fname;
    uint32_t    len;
    uint8_t     priority;

    struct queue_entry *next;
};

class CFuzzer
{
    private:
        struct queue_entry *queue_head = NULL; /* Head pointer of the queue */
        struct queue_entry *queue_cur = NULL; /* Current pointer of the queue */
        struct queue_entry *queue_tail = NULL; /* Tail pointer of the queue */
        uint8_t queue_len = 0; /* Length of the queue */
        void UpdateCoverMap();
        void AddToQueue();
        void FuzzOne();
    public:
        void ReadTestCases();
        void DryRun();
        void FuzzCycle();
};

#endif // FUZZER_H
