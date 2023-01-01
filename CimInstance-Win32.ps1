$Win32CimClasses = Get-CimClass | Where-Object {$_.CimClassName -like "Win32*" -and $_.CimClassName -NotLike "Win32_Perf*"}
$Win32CimClassesName = $Win32CimClasses.CimClassName
$Win32CimClassesLength = $Win32CimClasses.Length

foreach ($CimClass in $Win32CimClassesName) {
    $ClassNumber = $Win32CimClassesName.Indexof($Cimclass)+1
    Write-Output "Output from $CimClass - $ClassNumber/$Win32CimClassesLength"
    Write-Host "Press any key to continue..."
    Read-Host
    Get-CimInstance -ClassName $CimClass | Select-Object -First 10 | Format-Table -AutoSize
    Write-Output "This was the output from $CimClass"
    Write-Host "Press any key to continue..."
    Write-Host " "
    Write-Host " "
}

Get-CimInstance -ClassName "Win32_ComputerSystem" | Select-Object -Property * | Format-List
Get-CimInstance -ClassName "Win32_Processor" | Format-List
Get-CimInstance -ClassName "Win32_Printer" | Format-List -Property Name, PrinterState, PrinterStatus
Get-CimInstance -ClassName "Win32_BIOS" | Select-Object -Property *
Get-CimInstance -ClassName "Win32_PrinterDriver" | Format-list -Property Name, Configfile, DataFile, DependentFiles, DriverPath
Get-CimInstance -ClassName "Win32_Printjob" | Format-List
Get-CimInstance -ClassName "Win32_Account" | Where-Object {$_.Name -like "adm*"} | Select-Object Name, AccountType, SID
    <# In a Windows operating system, the default SID (Security Identifier) for the administrator account is S-1-5-21-<DomainId>-500, where <DomainId> is the domain identifier for the domain in which the administrator account is located. The SID (Security Identifier) S-1-5-32-544 is a well-known SID that is used to identify the built-in administrator account on a Windows operating system. This SID is the same on all Windows systems, regardless of the domain or computer. #>
Get-CimInstance -ClassName "Win32_UserAccount" | Where-Object {$_.Name -like "adm*"} | Select-Object Name, AccountType, SID
Get-CimInstance -ClassName "Win32_Group" | Select-Object Name, SID
Get-CimInstance -ClassName "Win32_TCPIPPrinterPort" | Select-Object Name, Description
Get-CimInstance -ClassName "Win32_Environment"
Get-CimInstance -ClassName "Win32_Share" 
Get-CimInstance -ClassName "Win32_IP4RouteTable"
Get-CimInstance -ClassName "Win32_ShadowCopy"
Get-CimInstance -ClassName "Win32_Session"
Get-CimInstance -ClassName "Win32_ServerConnection"
Get-CimInstance -ClassName "Win32_Directory" | Where-Object { $_.Name -like "*powershell*" } | Select-Object Name -First 20
Get-CimInstance -ClassName "Win32_NTEventLogfile" | Sort-Object NumberOfRecords -Descending
Get-CimInstance -ClassName "Win32_PhysicalMemory" | Select-Object DeviceLocator, Manufacturer, PartNumber, SerialNumber, Speed | Format-Table 
Get-CimInstance -ClassName "Win32_SystemEnclosure"
Get-CimInstance -ClassName "Win32_PhysicalMemoryArray" | Format-List
Get-CimInstance -ClassName "Win32_PortConnector" | Where-Object { -not ($_.ExternalReferenceDesignator -eq "") } | Select-Object Tag, PortType, Space, ExternalReferenceDesignator
Get-CimInstance -ClassName "Win32_LocalTime" | Format-Table
Get-CimInstance -ClassName "Win32_UTCTime" | Format-Table  
Get-CimInstance -ClassName "Win32_NTLogEvent" | Select-Object -First 10 | Format-List -Property TimeWritten, Message
Get-CimInstance -ClassName "Win32_TimeZone"  
Get-CimInstance -ClassName "Win32_StartupCommand"
Get-CimInstance -ClassName "Win32_GroupUser"
Get-CimInstance -ClassName "Win32_WinSAT"
Get-CimInstance -ClassName "Win32_InstalledWin32Program" | Format-Table -Property Name, Vendor, Version
Get-CimInstance -ClassName "Win32_ReliabilityStabilityMetrics" | Select-Object -First 20 |Format-Table -Property TimeGenerated, SystemStabilityIndex
Get-CimInstance -ClassName "Win32_Product" | Sort-Object Name | Format-Table Name, Vendor
Get-CimInstance -ClassName "Win32_ComputerSystemProduct"
Get-CimInstance -ClassName "Win32_PerfRawData_WorkUnitCounterProvider_WorkUnit" | Format-Table -Property Name, AppOwnerProcessID, HostProcessID



