$LoggedOnUsers = Get-WMIObject -Class Win32_ComputerSystem | Select-Object UserName
Write-Output $LoggedOnUsers.UserName

#Get all Objects
#Get-WMIObject -Class Win32_ComputerSystem | Get-Member
