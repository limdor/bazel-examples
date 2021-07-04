$folders = Get-ChildItem | Where-Object{$_.PSISContainer}
foreach ($folder in $folders){
    if(-Not ($folder -Match ".bazelci") ){
      $output = "-- Executing CI commands for example $folder --"
      Write-Host "".PadRight($output.length, '-')
      Write-Host $output
      Write-Host "".PadRight($output.length, '-')
      Invoke-Expression -Command (Join-Path $folder "ci_execution.ps1")
      if ($LASTEXITCODE -ne "0") {
        Write-Error "ci_execution.ps1 failed" -ErrorAction Stop
      }
    }
}
