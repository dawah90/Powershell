Get-Date -Format "dddd dd/MM HH:mm" | Out-File "C:\_LKadmin\Windows-Defender-definition-check.log" -Append
Get-MpComputerStatus | Format-list *SignatureVersion | Out-File "C:\_LKadmin\Windows-Defender-definition-check.log" -Append
