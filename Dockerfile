# Use an appropriate base image with the necessary dependencies
FROM mcr.microsoft.com/windows/servercore:ltsc2019

# Set the working directory inside the container
WORKDIR /app

# Install required tools and dependencies
RUN powershell -Command \
    choco install -y visualstudio2019buildtools --package-parameters "--add Microsoft.VisualStudio.Component.VC.Tools.x86.x64 --add Microsoft.VisualStudio.Workload.NativeDesktop --add Microsoft.VisualStudio.Component.Windows10SDK --add Microsoft.VisualStudio.Component.VC.Redist.14.Latest" ; \
    choco install -y cmake --installargs 'ADD_CMAKE_TO_PATH=System' ; \
    choco install -y qt6 --package-parameters "--add Microsoft.VisualStudio.Component.QT.VisualStudioTools --add Microsoft.VisualStudio.Component.QT.6.6.1.VisualStudioTools" ; \
    choco install -y rust ; \
    choco install -y git ; \
    Remove-Item -Force -Recurse \"${Env:ProgramData}\chocolatey\cache\*\"; \
    Remove-Item -Force -Recurse \"${Env:TEMP}\*\*\"; \
    Remove-Item -Force -Recurse \"${Env:TEMP}\*\";

# Set environment variables if necessary
# ENV MY_CUSTOM_VAR=my_value

# Copy project files into the container
COPY . .

# Specify any additional setup or configuration steps
# RUN ./configure
# RUN make install

# Define the command to run your application
CMD [ "cmd", "/k", "echo Docker container started..." ]
