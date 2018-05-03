#include "cudaLib.h"

#include <iostream>
#include <cuda.h>
#include <cuda_runtime.h>

namespace {
    template <typename T>
    __global__ void kernel(T aValue) {
        printf("Hello from CUDA with value=%d\n", aValue);
    }
}

// explicit instantiation
template void cudaRun<int>(int);
template void cudaRun<uint16_t>(uint16_t);

template <typename T>
void cudaRun(T aValue) {
    kernel<<<1,1>>>(aValue);
    cudaDeviceSynchronize();
    if (cudaGetLastError() != cudaSuccess) printf("Error: %s\n", cudaGetErrorString(cudaGetLastError()));
}
