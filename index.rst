# CudaTemplate
Easiest possible cmake project using both - nvcc and host compiler - 
serving as a copy/paste template for new CUDA projects.

To run build launch these commands:

``` commandline

mkdir build
cd build
cmake -DCMAKE_BUILD_TYPE=Release ..
make -j 4


```

Build is divided into two main steps:
- first static and library are build (mixed CUDA and host code)
- main executables are build one with shared and one with static library

To see exact commands during build set VERBOSE before 'make':
```
export VERBOSE=1
```
