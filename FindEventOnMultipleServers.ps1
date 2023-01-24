#Example 1 - Everything to console 
#$User = "UserName"
#$WinEvents = Invoke-Command -ComputerName bmards002,bmards003,bmards004,bmards005,bmards006 -Scriptblock { Get-WinEvent -LogName "Microsoft-Windows-TerminalServices-LocalSessionManager/Operational" }
#$WinEvents | Where-Object {$_.ID -eq "21" -and $_.Message -like "*$user*"} | Sort-Object TimeCreated | Format-List

#Example 2 - Selected values to log file
#$User = "UserName"
#$WinEvents = Invoke-Command -ComputerName bmards002,bmards003,bmards004,bmards005,bmards006 -Scriptblock { Get-WinEvent -LogName "Microsoft-Windows-TerminalServices-LocalSessionManager/Operational" }
#$WinEvents | Where-Object {$_.ID -eq "21" -and $_.Message -like "*$user*"} | Sort-Object TimeCreated | Format-List -Property TimeCreated, MachineName, Message | Out-File -FilePath "C:\temp\PowerShellOutput.log" -append

#Example 3 - Selected text from message with specific time format
$User = "UserName"
$WinEvents = Invoke-Command -ComputerName bmards002,bmards003,bmards004,bmards005,bmards006 -Scriptblock { Get-WinEvent -LogName "Microsoft-Windows-TerminalServices-LocalSessionManager/Operational" }
$FoundEvents = $WinEvents | Where-Object {$_.ID -eq "21" -and $_.Message -like "*$user*"} | Sort-Object TimeCreated

Foreach ($FoundEvent in $FoundEvents) {
    Write-Output ""
    Write-Output $FoundEvent.Message.Substring(59,12)
    Write-Output $FoundEvent.TimeCreated.ToString("yyyy-MM-dd - HH:mm")
    Write-Output $FoundEvent.MachineName
}
