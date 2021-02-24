# CudaTemplate
Easiest possible cmake project using both - nvcc and host compiler - 
serving as a copy/paste template for new CUDA projects.

To execute build launch these commands (after cloning the project):

``` commandline

mkdir build
cd build
cmake -DCMAKE_BUILD_TYPE=Release ..
make -j 4


```

Build is divided into two main steps:
- static and shared library are build (mixed CUDA and CPU/host code)
- main executables are build - one with shared and one with static library produced in step above

To see exact commands during build set VERBOSE before 'make':
```
export VERBOSE=1
```

Of course for particular projects only subset of these steps is needed but... from my experience it is much easier to remove unnecessery steps than always trying to figure out how to create them ;-)

Enjoy!
