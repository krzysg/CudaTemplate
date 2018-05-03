cmake_minimum_required(VERSION 3.9)
project(TestCuda)

set(CMAKE_CXX_STANDARD 14)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++14 -Wall -pedantic -fvisibility=hidden")

set(CMAKE_CUDA_STANDARD 14)
set(CMAKE_CUDA_FLAGS "--cudart shared -g -lineinfo -Xptxas -O3,-v")
set(CMAKE_CXX_FLAGS_RELEASE "-O3 -ffast-math")
set(CMAKE_CXX_FLAGS_DEBUG "-O0 -g")

#set(CUDA_SEPARABLE_COMPILATION ON)
#set(CMAKE_CUDA_SEPARABLE_COMPILATION ON)
enable_language(CUDA)

#message(STATUS "---------------------- VARS BEG ---------------------")
#get_cmake_property(_variableNames VARIABLES)
#foreach (_variableName ${_variableNames})
#    string(TOLOWER ${_variableName} currVar)
#    if (${currVar} MATCHES ".*cuda.*")
#        message(STATUS "${_variableName}=${${_variableName}}")
#    endif()
#endforeach()
#message(STATUS "---------------------- VARS END ---------------------")


add_library(sharedLib SHARED src/tools.cu src/norm.cc)

add_executable(main src/main.cc)
#set_property(TARGET main PROPERTY CUDA_SEPARABLE_COMPILATION OFF)
target_link_libraries(main sharedLib)