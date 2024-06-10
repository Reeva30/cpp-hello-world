# Use the official Windows Server Core image as the base image
FROM mcr.microsoft.com/windows/servercore:ltsc2019

# Set up environment variables
ENV CHOCO_INSTALL_PATH="C:\ProgramData\chocolatey\bin"

# Install Chocolatey
RUN powershell -Command \
    Set-ExecutionPolicy Bypass -Scope Process -Force; \
    [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; \
    iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

# Install Visual Studio Build Tools, CMake, and Rust
RUN choco install visualstudio2022buildtools --package-parameters "--add Microsoft.VisualStudio.Component.VC.Tools.x86.x64 --add Microsoft.VisualStudio.Workload.NativeDesktop --add Microsoft.VisualStudio.Component.Windows10SDK --add Microsoft.VisualStudio.Component.VC.Redist.14.Latest" -y && \
    choco install cmake rust -y

# Set up the Visual Studio Build Environment
RUN call "C:\Program Files (x86)\Microsoft Visual Studio\2022\BuildTools\VC\Auxiliary\Build\vcvars64.bat"
