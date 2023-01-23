#Variable
$TempFolder = [System.IO.Path]::GetTempPath()
$FolderPath = Join-Path $TempFolder "ExchangeInstall"
 
#Check if Folder exists
If(!(Test-Path -Path $FolderPath))
{
    New-Item -ItemType Directory -Path $FolderPath
    Write-Host "New folder $FolderPath created successfully!" -f Green
}
Else
{
  Write-Host "Folder already exists!" -f Yellow
}


$joinURL  = "https://raw.githubusercontent.com/jaricardodev/quickstart-microsoft-exchange/main/scripts/Join-Domain.ps1"

$Path = "$FolderPath\Join-Domain.ps1"

Invoke-WebRequest -URI $URL -OutFile $Path