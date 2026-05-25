Set-StrictMode -Version latest
$ErrorActionPreference = "Stop"
$PSNativeCommandUseErrorActionPreference = $true
Set-Location $PSScriptRoot
# In case Appveyor decides to update the Visual Studio installation this will help to figure out the new version
Get-ChildItem env:
whereis gcc-12
whereis gcc
ls -ld /usr/bin/*gcc* /bin/*gcc* /home/appveyor/bin/*
ls -ld /usr/bin/*ld* /bin/*ld* /home/appveyor/bin/*
