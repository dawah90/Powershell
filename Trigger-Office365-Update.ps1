#Prepare variables
$Office64 = "C:\Program Files\Common Files\microsoft shared\ClickToRun\OfficeC2RClient.exe"
$Office32 = "C:\Program Files (x86)\Common Files\microsoft shared\ClickToRun\OfficeC2RClient.exe"
$Outlook64 = "C:\Program Files\Microsoft Office\root\Office16\Outlook.exe"
$Outlook32 = "C:\Program Files (x86)\Microsoft Office\root\Office16\Outlook.exe"
$Argument = '/update user displaylevel=none forceappshutdown=true'

#Check if 32-bit or 64-bit outlook is present on the target machine. Abort if none is.
if (Test-Path -Path $Outlook64) {
    Write-Host "Outlook 64-bit version $((Get-ChildItem -Path $Outlook64 | Select-Object -Expandproperty VersionInfo).ProductVersion)" -ForegroundColor Cyan
} 
elseif (Test-Path -Path $Outlook32) {
    Write-Host "Outlook 32-bit version $((Get-ChildItem -Path $Outlook32 | Select-Object -Expandproperty VersionInfo).ProductVersion)" -ForegroundColor Cyan
} 
else {
    Write-Host "No outlook found. Aborting script" -ForegroundColor Red
    break
}

#Check if 32-bit or 64-bit click2run installer is present on the target machine. Abort if false and trigger silent update with forced application shutdown if true.
if (Test-Path -Path $Office64) {
    Write-Host "Trigger Office 64-bit update" -ForegroundColor Cyan 
    Start-Process "$Office64" -ArgumentList "$Argument"
} 
elseif (Test-Path -Path $Office32) {
    Write-Host "Trigger Office 32-bit update" -ForegroundColor Cyan
    Start-Process "$Office32" -ArgumentList "$Argument"
} 
else {
    Write-Host "Click2Run installer not found" -ForegroundColor Red
    break
}
