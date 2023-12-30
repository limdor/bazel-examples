Set-StrictMode -Version latest
$ErrorActionPreference = "Stop"
$PSNativeCommandUseErrorActionPreference = $true
Set-Location $PSScriptRoot
if($IsWindows) {
    Write-Host "Skipping 'python' example on Windows"
    Write-Host "It is not working in the Appveyor CI because it is not properly setup"
} else {
    bazel version
    bazel run //:buildifier
    bazel build //...
    bazel run //:bin
    bazel test //:test
}
