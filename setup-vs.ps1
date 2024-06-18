# Install VSSetup module
Install-Module -Name VSSetup -Force -AllowClobber

# Import the module
Import-Module VSSetup

# Get Visual Studio instance
$vs = Get-VSSetupInstance -All | Where-Object { $_.InstallationPath -ne $null }

# Check if Visual Studio instance is found
if ($vs) {
    $vsPath = $vs[0].InstallationPath
    Start-Process -FilePath "$vsPath\Common7\IDE\devenv.exe" -ArgumentList '/InstallVSPackage','0A5A7800-D8E3-4A6F-85D8-BC8A7B473F24' -Wait
} else {
    Write-Error 'Visual Studio instance not found'
}
