Set-StrictMode -Version latest
$ErrorActionPreference = "Stop"
$PSNativeCommandUseErrorActionPreference = $true
Set-Location $PSScriptRoot
bazel version
bazel run //:buildifier
bazel build //...
bazel test //:foo_test
if($IsWindows) {
    Write-Host "Skipping 'bazel coverage //:foo_test' on Windows"
    Write-Host "Bazel coverage is not supported on Windows"
    Write-Host "See https://github.com/bazelbuild/bazel/issues/6374"
} else {
    bazel coverage //:foo_test
}
