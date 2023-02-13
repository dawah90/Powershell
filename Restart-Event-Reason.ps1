Get-EventLog -LogName System | Where-Object {$_.EventID -in (1074)} | Select-Object @{Name="ShutDownType"; Expression={ $_.Message.Substring($_.Message.Indexof("starta om"),10)}}, TimeGenerated, EventID -First 30 | format-table -Property TimeGenerated,EventId,Type -AutoSize -wrap
$ComputerName = Hostname
#EnVariableFörUserName
Get-EventLog -LogName System | Where-Object {$_.EventID -in (1074)} | Select-Object @{Name="Processen"; Expression={ $_.Message.Substring($_.Message.Indexof("C:\"),$_.Message.Indexof("($ComputerName)"))}}, TimeGenerated, EventID -First 30 | format-table -Property TimeGenerated,EventId,Processen -AutoSize -wrap
Get-EventLog -LogName System | Where-Object {$_.EventID -in (1074)} | Select-Object @{Name="Processen"; Expression={ $_.Message.Substring(0,$_.Message.Indexof("($ComputerName)"))}}, TimeGenerated, EventID -First 30 | format-table -Property TimeGenerated,EventId,Processen -AutoSize -wrap
Get-EventLog -LogName System | Where-Object {$_.EventID -in (1074)} | Select-Object @{Name="ShutDownType"; Expression={ $_.Message.Substring($_.Message.Indexof("starta om"),10)}}, TimeGenerated, EventID -First 30 | format-table -Property TimeGenerated,EventId,Type -AutoSize -wrap
Get-EventLog -LogName System | Where-Object {$_.EventID -in (1074)} | Select-Object @{Name="Type"; Expression={ $_.Message.Substring(202,10)}}, TimeGenerated, EventID, Message -First 30 | format-table -Property TimeGenerated,EventId,Type,Message -AutoSize -wrap

$DiskValues = Get-Volume | Where-Object DriveLetter -ne $NULL |Select-Object -Property Path,DriveLetter,`
@{Name="Percent Used"; Expression={ "{0:P2}" -f (($_.Size - $_.SizeRemaining)/$_.Size) }},`
@{Name="GB Used"; Expression={ "{0:N1}" -f (($_.Size - $_.SizeRemaining)/1GB) }},`
@{Name="GB Remaining"; Expression={ "{0:N1}" -f ($_.SizeRemaining/1GB) }},`
@{Name="GB Total"; Expression={ "{0:N1}" -f ($_.Size/1GB) }}


("Processen C:\windows\Explorer.EXE (BMA059) har startat starta om på datorn BMA059 för användaren LKNET\danwah av följande orsak: Annat (oplanerat)
                                        Orsakskod: 0x0").Length
