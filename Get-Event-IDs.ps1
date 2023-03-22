#Example 1
Get-WinEvent -FilterHashtable @{ ProviderName="Microsoft-Windows-Windows Defender";ID=1121;StartTime=[datetime]"2023-01-13" } | select -ExpandProperty Message

#Example 2 - Get EventIDs between 2 dates
Get-WinEvent -FilterHashtable @{ logname="System";StartTime=[datetime]"2023-03-20 17:45:00";EndTime=[datetime]"2023-03-20 17:49:00" }

#Example 3 - Get EventID 41
Get-WinEvent -FilterHashtable @{ logname="System";ID=41 }
