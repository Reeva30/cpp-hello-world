# Use an official image as a parent image
FROM mcr.microsoft.com/windows/servercore:ltsc2019

# Install Visual Studio Build Tools
RUN choco install -y visualstudio2019buildtools --package-parameters "--add Microsoft.VisualStudio.Component.VC.Tools.x86.x64 --add Microsoft.VisualStudio.Workload.NativeDesktop --add Microsoft.VisualStudio.Component.Windows10SDK --add Microsoft.VisualStudio.Component.VC.Redist.14.Latest"

# Install CMake
RUN choco install -y cmake --installargs 'ADD_CMAKE_TO_PATH=System'

# Install Qt
RUN choco install -y qt

# Copy the current directory contents into the container at /src
COPY . /src

# Set the working directory to /src
WORKDIR /src

# Run cmake to configure the project and generate build files
RUN cmake -B build -S .

# Build the project
RUN cmake --build build --config Release

# Run tests (adjust the path as necessary)
RUN build\Release\your_test_executable.exe
