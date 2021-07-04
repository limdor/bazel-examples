Set-Location $PSScriptRoot
if($IsWindows) {
    Write-Host "Skipping 'linux_toolchain' on Windows"
    Write-Host "Like the name of the example says, this in Linux only"
} else {
    bazel version
    bazel run //:buildifier
    bazel build //...
    bazel build //... --platforms=//platform:linux_x64
    bazel run //:hello_world
}
