Set-StrictMode -Version latest
$ErrorActionPreference = "Stop"
$PSNativeCommandUseErrorActionPreference = $true
Set-Location $PSScriptRoot
bazel version
if($IsWindows) {
    Write-Host "Skipping 'bazel run //:buildifier' on Windows"
    Write-Host "Running buildifier from the Bazel rule does not work on Windows"
    Write-Host "See https://github.com/bazelbuild/buildtools/issues/346 and https://github.com/bazelbuild/buildtools/issues/770"
} else {
    bazel run //:buildifier
}
bazel build //...
bazel test //...
