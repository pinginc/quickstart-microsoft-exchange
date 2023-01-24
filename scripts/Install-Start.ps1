try { 
    $TempFolder = "C:\"
    $FolderPath = Join-Path $TempFolder "ExchangeInstall"
    
    Start-Transcript -Path "$FolderPath\log\Install-Start.ps1.txt" -Append

    $joinDomainFileURL  = "https://raw.githubusercontent.com/jaricardodev/quickstart-microsoft-exchange/main/scripts/Join-Domain.ps1"

    $Path = "$FolderPath\Join-Domain.ps1"

    Invoke-WebRequest -URI $joinDomainFileURL -OutFile $Path

    stop-transcript|out-null
}
catch {
    Write-Verbose "$($_.exception.message)@ $(Get-Date)"
    stop-transcript|out-null
}
