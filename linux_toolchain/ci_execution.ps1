Set-StrictMode -Version latest
$ErrorActionPreference = "Stop"
$PSNativeCommandUseErrorActionPreference = $true
Set-Location $PSScriptRoot
if ($IsWindows) {
    Write-Host "Skipping 'linux_toolchain' on Windows"
    Write-Host "Like the name of the example says, this in Linux only"
}
else {
    bazel version
    bazel run //:buildifier
    if ($Env:APPVEYOR_BUILD_WORKER_IMAGE) {
        Write-Host "Skipping running this example in the CI"
        Write-Host "That the generated toolchain works is highly dependent on the environment"
    }
    else {
        bazel build //...
        bazel build //... --platforms=//platform:linux_x64
        bazel run //:hello_world
    }
}
