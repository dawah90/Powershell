$LogLocation = "C:\Temp"

if (-not (Test-Path -path $LogLocation)) {
    New-Item $LogLocation -ItemType Directory
}

$DateNow = Get-Date -UFormat "%Y-%m-%d-%H-%M-%S"
Start-Transcript -Path "$logLocation\Powershell-$DateNow.log"
