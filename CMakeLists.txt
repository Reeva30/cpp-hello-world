cmake_minimum_required(VERSION 3.10)
project(HelloWorld)

# Specify the toolchain file if not passed in the command line
if (NOT DEFINED CMAKE_TOOLCHAIN_FILE)
    set(CMAKE_TOOLCHAIN_FILE "${CMAKE_SOURCE_DIR}/vcpkg/scripts/buildsystems/vcpkg.cmake")
endif()

set(CMAKE_CXX_STANDARD 11)

# Find the Qt5 package
find_package(Qt5 COMPONENTS REQUIRED Core)

# Create the executable
add_executable(main main.cpp)

# Link the Qt5 libraries to the executable
target_link_libraries(main PRIVATE Qt5::Core)
