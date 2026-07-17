Set-StrictMode -Version latest
$ErrorActionPreference = "Stop"
$PSNativeCommandUseErrorActionPreference = $true
Set-Location $PSScriptRoot
# In case Appveyor decides to update the Visual Studio installation this will help to figure out the new version
# Get-ChildItem env:
bazel version
if ($IsWindows) {
    bazel run //:buildifier
    if ($Env:APPVEYOR_BUILD_WORKER_IMAGE -eq "Visual Studio 2022") {
        bazel build //...
        bazel build //... --platforms=//platform:windows_x64
        bazel run //:hello_world
    }
    else {
        Write-Host "Skipping 'windows_toolchain' if the image is not having Visual Studio 2022"
    }
}
else {
    Write-Host "Skipping 'windows_toolchain' example on Linux"
    Write-Host "Like the name of the example says, this in Windows only"
}
