try { 
    $TempFolder = "C:\"
    $FolderPath = Join-Path $TempFolder "ExchangeInstall"
    
    Start-Transcript -Path "$FolderPath\log\Install-Start.ps1.txt" -Append

    $JoinDomainFileURL  = "https://raw.githubusercontent.com/jaricardodev/quickstart-microsoft-exchange/main/scripts/Join-Domain.ps1"

    $JoinDomainFileLocalPath = "$FolderPath\Join-Domain.ps1"
  
    if (Test-Path $JoinDomainFileLocalPath) {
      Write-Host "File $JoinDomainFileLocalPath already exists" -ForegroundColor Green
    }
    else{
      Invoke-WebRequest -URI $JoinDomainFileURL -OutFile $JoinDomainFileLocalPath

      if (Test-Path $JoinDomainFileLocalPath) {
        Write-Host "File $JoinDomainFileLocalPath downloaded" -ForegroundColor Green
      }
    }    

    Invoke-Expression -Command "$FolderPath\Join-Domain.ps1"

    stop-transcript|out-null
}
catch {
    Write-Verbose "$($_.exception.message)@ $(Get-Date)"
    stop-transcript|out-null
}
