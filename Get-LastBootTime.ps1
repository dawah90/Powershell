#Get last boot time

Get-WmiObject -Class Win32_OperatingSystem | select @{N="BootTime"; E={$_.ConvertToDateTime($_.LastBootUpTime)}}