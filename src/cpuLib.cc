#include "cpuLib.h"

#include <iostream>

// explicit instantiation
template void cpuRun<int>(int);
template void cpuRun<double>(double);

template <typename T>
void cpuRun(T aValue) {
    std::cout << "Hello from CPU with value=" << aValue << std::endl;
}
