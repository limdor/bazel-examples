Set-StrictMode -Version latest
$ErrorActionPreference = "Stop"
$PSNativeCommandUseErrorActionPreference = $true
Set-Location $PSScriptRoot
bazel version
if ($IsWindows) {
    Write-Host "Skipping 'bazel run //:buildifier' on Windows"
    Write-Host "Running buildifier from the Bazel rule does not work on Windows"
    Write-Host "See https://github.com/keith/buildifier-prebuilt/issues/99 and https://github.com/bazelbuild/bazel-central-registry/issues/380"
}
else {
    bazel run //:buildifier
}
bazel build //...
bazel run //:hello_world_everyone
bazel run //:hello_world_code_dive
bazel run //:hello_world_ndc_techtown
