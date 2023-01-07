#WMI
$LoggedOnUserWMI = Get-WMIObject -Class "Win32_ComputerSystem" | Select-Object -Property UserName
Write-Output $LoggedOnUserWMI.UserName

#CIM
$LoggedOnUserCIM = Get-CimInstance -ClassName "Win32_ComputerSystem" | Select-Object -Property UserName
Write-Output $LoggedOnUserCIM.UserName

