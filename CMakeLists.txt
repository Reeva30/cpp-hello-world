cmake_minimum_required(VERSION 3.10)
project(HelloWorld)

# Specify the toolchain file if not passed in the command line
if (NOT DEFINED CMAKE_TOOLCHAIN_FILE)
    set(CMAKE_TOOLCHAIN_FILE "${CMAKE_SOURCE_DIR}/vcpkg/scripts/buildsystems/vcpkg.cmake")
endif()

set(CMAKE_CXX_STANDARD 11)

# Create the executable
add_executable(main main.cpp)
