$User = "UserName"
$WinEvents = Invoke-Command -ComputerName bmards002,bmards003,bmards004,bmards005,bmards006 -Scriptblock { Get-WinEvent -LogName "Microsoft-Windows-TerminalServices-LocalSessionManager/Operational" }
$WinEvents | Where-Object {$_.ID -eq "21" -and $_.Message -like "*$user*"} | Sort-Object TimeCreated | Format-List
