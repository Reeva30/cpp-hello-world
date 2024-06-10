# Use an appropriate Windows base image
FROM mcr.microsoft.com/windows/servercore:ltsc2019

# Set the working directory inside the container
WORKDIR /app

# Install necessary packages and tools using Chocolatey
RUN powershell -Command \
    Set-ExecutionPolicy Bypass -Scope Process -Force; \
    [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; \
    iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1')); \
    choco install -y visualstudio2019buildtools --package-parameters "--add Microsoft.VisualStudio.Component.VC.Tools.x86.x64 --add Microsoft.VisualStudio.Workload.NativeDesktop --add Microsoft.VisualStudio.Component.Windows10SDK --add Microsoft.VisualStudio.Component.VC.Redist.14.Latest"; \
    choco install -y cmake --installargs 'ADD_CMAKE_TO_PATH=System'; \
    choco install -y qt6 --package-parameters "--add Microsoft.VisualStudio.Component.QT.VisualStudioTools --add Microsoft.VisualStudio.Component.QT.6.6.1.VisualStudioTools"; \
    choco install -y rust; \
    choco install -y git; \
    Remove-Item -Force -Recurse "${Env:ProgramData}\chocolatey\cache\*"; \
    Remove-Item -Force -Recurse "${Env:TEMP}\*\*"; \
    Remove-Item -Force -Recurse "${Env:TEMP}\*";

# Copy source code into the container
COPY . .

# Configure and build the project
RUN cmake -B build -S . -G "Visual Studio 16 2019" -A x64
RUN cmake --build build --config Release

# Set the entry point
CMD ["cmd", "/k", "echo Docker container started..."]
