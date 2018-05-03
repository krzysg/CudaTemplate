#include <iostream>
#include "tools.h"
#include <cuda.h>
#include <cuda_runtime.h>

namespace {
void foo() {
	run<int>();
}

template <typename T>
__global__ void kernel(T val) {
	printf("Hello CUDA. %d\n", val);
}
}

template <typename T>
void run() {
	T i = 3;
       	kernel<<<1,1>>>(i);
        cudaDeviceSynchronize();
        cudaError_t err = cudaGetLastError();
        if (err != cudaSuccess) printf("Error: %s\n", cudaGetErrorString(err));
}

