if (-not (Test-Path -path "C:\Temp")) {
    New-Item "C:\Temp" -ItemType Directory
}

$DateNow = Get-Date -UFormat "%Y-%m-%d-%H-%M-%S"
Start-Transcript -Path "C:\Temp\Powershell-$DateNow.log"
