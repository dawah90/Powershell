Get-WinEvent -FilterHashtable @{ ProviderName="Microsoft-Windows-Windows Defender";ID=1121;StartTime=[datetime]"2023-01-13" } | select -ExpandProperty Message
