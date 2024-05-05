# Minimum CMake version required
cmake_minimum_required(VERSION 3.10)

# Project Name
project(HelloWorld)

# C++ Standard
set(CMAKE_CXX_STANDARD 11)

# Create the executable from main.cpp
add_executable(main main.cpp)
