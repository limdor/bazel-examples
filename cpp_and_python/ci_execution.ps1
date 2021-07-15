Set-StrictMode -Version latest
$ErrorActionPreference = "Stop"
Set-Location $PSScriptRoot
if($IsWindows) {
    Write-Host "Skipping 'cpp_and_python' example on Windows"
    Write-Host "It is not working in the Appveyor CI because it is not properly setup"
} else {
    bazel version
    bazel run //:buildifier
    bazel build //...
    bazel run //:hello_world_everyone
    bazel run //:hello_world_code_dive
}
