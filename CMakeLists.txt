# Example CMakeLists.txt for a Qt application
cmake_minimum_required(VERSION 3.10)
project(HelloWorld)

# Specify the toolchain file if not passed in the command line
if (NOT DEFINED CMAKE_TOOLCHAIN_FILE)
    set(CMAKE_TOOLCHAIN_FILE "${CMAKE_SOURCE_DIR}/vcpkg/scripts/buildsystems/vcpkg.cmake")
endif()

set(CMAKE_CXX_STANDARD 11)

# Find the required Qt packages
find_package(Qt5 COMPONENTS Core Gui Widgets REQUIRED)

# Create the executable
add_executable(main main.cpp)

# Link against the necessary Qt libraries
target_link_libraries(main Qt5::Core Qt5::Gui Qt5::Widgets)
