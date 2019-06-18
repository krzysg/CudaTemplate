cmake_minimum_required(VERSION 3.9)
project(CudaTemplate)


# ----------------------- COMPILERS -------------------------------------------
# Host compiler settings
set(CMAKE_CXX_STANDARD 14)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

set(CMAKE_CXX_FLAGS "-Wall -pedantic -fvisibility=default -fPIC ${CMAKE_CXX_FLAGS}")
set(CMAKE_CXX_FLAGS_RELEASE "-O3 -ffast-math ${CMAKE_CXX_FLAGS_RELEASE}")
set(CMAKE_CXX_FLAGS_DEBUG "-O0 -g ${CMAKE_CXX_FLAGS_DEBUG}")
message(STATUS "CXX flags         [${CMAKE_CXX_FLAGS}]")
message(STATUS "CXX release flags [${CMAKE_CXX_FLAGS_RELEASE}]")
message(STATUS "CXX debug flags   [${CMAKE_CXX_FLAGS_DEBUG}]")

# CUDA compiler settings
set(CMAKE_CUDA_STANDARD 14)
set(CMAKE_CUDA_SEPARABLE_COMPILATION ON)
#set(CMAKE_CUDA_FLAGS "--compiler-options '-fPIC' --cudart shared -g -lineinfo -Xptxas -O3,-v ${CMAKE_CUDA_FLAGS}")
enable_language(CUDA)
include_directories(${CMAKE_CUDA_TOOLKIT_INCLUDE_DIRECTORIES})
set(CMAKE_CUDA_FLAGS "--compiler-options '-fPIC' --cudart shared -g -lineinfo -Xptxas -O3,-v ${CMAKE_CUDA_FLAGS}")
message(STATUS "CUDA flags        [${CMAKE_CUDA_FLAGS}]")


# Print variables (uncomment for debug)
#
#message(STATUS "---------- VARS BEGIN ---------")
#get_cmake_property(_variableNames VARIABLES)
#foreach (_variableName ${_variableNames})
#    string(TOLOWER ${_variableName} currVar)
#    if (${currVar} MATCHES ".*cuda.*")
#        message(STATUS "${_variableName}=${${_variableName}}")
#    endif()
#endforeach()
#message(STATUS "---------- VARS END -----------")


# ----------------------- LIBS ------------------------------------------------
# Produce static and shared library
set (LIB_SRC src/cudaLib.cu src/cpuLib.cc)
add_library(objLib OBJECT ${LIB_SRC})

add_library(sharedLib SHARED $<TARGET_OBJECTS:objLib>)
add_library(staticLib STATIC $<TARGET_OBJECTS:objLib>)


# ----------------------- EXECUTABLES -----------------------------------------
# Generate executable with static library

set(EXE_SRC src/main.cc)

add_executable(mainStatic ${EXE_SRC})
target_link_libraries(mainStatic staticLib)

# Generate executable with hsared library
add_executable(mainShared ${EXE_SRC})
target_link_libraries(mainShared sharedLib)
