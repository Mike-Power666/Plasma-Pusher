cmake_minimum_required(VERSION 3.10)  
project(PlasmaPusher Fortran)        

# Set Fortran compiler flags
set(CMAKE_Fortran_FLAGS "-Wall -O2")

# Add source files
file(GLOB SRC_FILES "src/*.f90")

# Specify the output directory for the build
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/Build)

# Add the executable
add_executable(plasma_solver ${SRC_FILES})

# Include directories (if needed)
include_directories(${CMAKE_SOURCE_DIR}/src)