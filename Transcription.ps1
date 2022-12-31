$LogLocation = "C:\Temp"

if (-not (Test-Path -path $LogLocation)) {
    New-Item $LogLocation -ItemType Directory
}

if (-not ($DateNow)) {
    $DateNow = Get-Date -UFormat "%Y-%m-%d-%H-%M-%S"
    $Transcript = "$logLocation\Powershell-$DateNow.log"
} 

if (-not (Test-Path -path $Transcript)) {
    Start-Transcript -Path $Transcript
}
