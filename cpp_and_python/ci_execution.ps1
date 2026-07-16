Set-StrictMode -Version latest
$ErrorActionPreference = "Stop"
$PSNativeCommandUseErrorActionPreference = $true
Set-Location $PSScriptRoot
bazel version
bazel run //:buildifier
bazel build //...
bazel run //:hello_world_everyone
bazel run //:hello_world_code_dive
bazel run //:hello_world_ndc_techtown
