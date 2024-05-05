# Minimum CMake version required
cmake_minimum_required(VERSION 3.10)

# Project Name
project(HelloWorld)

# C++ Standard
set(CMAKE_CXX_STANDARD 11)

# Find Qt libraries
set(CMAKE_PREFIX_PATH "C:/Program Files/Qt/5.x/msvc2019_64")
find_package(Qt5 COMPONENTS Widgets REQUIRED)

# Create the executable
add_executable(main main.cpp)

# Link against Qt Widgets library
target_link_libraries(main Qt5::Widgets)
