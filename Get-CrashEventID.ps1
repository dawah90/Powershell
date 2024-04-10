<#
System events with either ID 41 or 124 between two timestamps
#>
Get-WinEvent -FilterHashtable @{ logname="System";ID=41,125;StartTime=[datetime]"2024-04-09 17:45:00";EndTime=[datetime]"2024-04-11 17:49:00" }
