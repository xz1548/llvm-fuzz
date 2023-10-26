#include "Helper.h"

int main(int argc, char **argv) {
    CHelper helper;
    helper.ParsingArgs(argc, argv);
    helper.InitOutFolder();

    return 0;
}