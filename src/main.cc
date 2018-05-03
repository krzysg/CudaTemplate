#include "cudaLib.h"
#include "cpuLib.h"
#include <cstdint>

int main() {
	cudaRun(123);
    cudaRun((uint16_t)111);
	cpuRun(6666);
    cpuRun(1.2);

	return 0;
}
