Set-StrictMode -Version latest
$ErrorActionPreference = "Stop"
$PSNativeCommandUseErrorActionPreference = $true
Set-Location $PSScriptRoot
# In case Appveyor decides to update the Visual Studio installation this will help to figure out the new version
# Get-ChildItem env:
bazel version
if ($IsWindows) {
    Write-Host "Skipping 'bazel run //:buildifier' on Windows"
    Write-Host "Running buildifier from the Bazel rule does not work on Windows"
    Write-Host "See https://github.com/keith/buildifier-prebuilt/issues/99 and https://github.com/bazelbuild/bazel-central-registry/issues/380"
    if ($Env:APPVEYOR_BUILD_WORKER_IMAGE -eq "Visual Studio 2019") {
        bazel build //...
        bazel build //... --platforms=//platform:windows_x64
        bazel run //:hello_world
    }
    else {
        Write-Host "Skipping 'windows_toolchain' if the image is not having Visual Studio 2019"
    }
}
else {
    Write-Host "Skipping 'windows_toolchain' example on Linux"
    Write-Host "Like the name of the example says, this in Windows only"
}
