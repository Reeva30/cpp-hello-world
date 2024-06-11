# Use a base Windows image
FROM mcr.microsoft.com/windows/servercore:ltsc2019

# Install Chocolatey
RUN powershell -Command Set-ExecutionPolicy Bypass -Scope Process -Force; `
    [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; `
    iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

# Install Visual Studio 2019 Build Tools
RUN choco install -y visualstudio2019buildtools --package-parameters "--add Microsoft.VisualStudio.Component.VC.Tools.x86.x64 --add Microsoft.VisualStudio.Workload.NativeDesktop --add Microsoft.VisualStudio.Component.Windows10SDK --add Microsoft.VisualStudio.Component.VC.Redist.14.Latest"

# Install CMake
RUN choco install -y cmake --installargs 'ADD_CMAKE_TO_PATH=System'

# Install Qt
RUN choco install -y qt

# Install Rust
RUN choco install -y rust

# Install Git
RUN choco install -y git

# Set up the working directory
WORKDIR /src

# Copy the current directory contents into the container at /src
COPY . .

# Run cmake to configure the project and generate build files
RUN cmake -B build -S .

# Build the project
RUN cmake --build build --config Release

# Run tests (adjust the path as necessary)
RUN build\Release\your_test_executable.exe
