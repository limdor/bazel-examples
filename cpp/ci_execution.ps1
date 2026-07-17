#Requires –Version 7.3
If ($PSVersionTable.PSVersion -lt [version]"7.4") {
    Write-Host "Powershell version lower than 7.4. We need to enable experimental feature PSNativeCommandUseErrorActionPreference"
    Enable-ExperimentalFeature PSNativeCommandErrorActionPreference
}
Set-StrictMode -Version latest
$ErrorActionPreference = "Stop"
$PSNativeCommandUseErrorActionPreference = $true
Set-Location $PSScriptRoot
bazel version
bazel run //:buildifier
bazel build //...
bazel run //:hello_world
