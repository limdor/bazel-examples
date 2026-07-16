Set-StrictMode -Version latest
$ErrorActionPreference = "Stop"
$PSNativeCommandUseErrorActionPreference = $true
Set-Location $PSScriptRoot
bazel version
bazel run //:buildifier
bazel build //...
bazel test //...
