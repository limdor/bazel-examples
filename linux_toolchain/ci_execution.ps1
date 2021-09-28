Set-StrictMode -Version latest
$ErrorActionPreference = "Stop"
$PSNativeCommandUseErrorActionPreference = $true
Set-Location $PSScriptRoot
Get-ChildItem env:
bazel build //:hello_world --subcommands=pretty_print
whereis gcc-12
whereis gcc
ls -ld /usr/bin/*gcc* /bin/*gcc* /home/appveyor/bin/*
ls -ld /usr/bin/*ld* /bin/*ld* /home/appveyor/bin/*
