Get-Process | `
Where-Object Name -eq "svchost" | `
#Select-Object * | `
Sort-Object HandleCount -Descending | `
Format-Table -Property Name, HandleCount, StartTime

##
<#
Get-NetAdapter | `
Where-Object Status -eq "Up" | `
Select-Object Name, ifindex | `
Format-List

$Adapterinfo = Get-NetAdapter | `
Where-Object Status -eq "Up"

foreach ($adapter in $Adapterinfo) {
    $ActiveLivingAdapter = Get-NetIPAddress -InterfaceIndex $adapter.ifIndex | Where-Object {$_.AddressFamily -eq "IPv4" -and $_.ValidLifeTime -lt "1"}
    $ActiveLivingAdapter.IPAddress
}
#>

$adapter = Get-NetAdapter | `
Where-Object Status -eq "Up"

$correctadapter = Get-NetIPAddress -InterfaceIndex $adapter.ifIndex | `
Where-Object {$_.AddressFamily -eq "IPv4" -and $_.ValidLifeTime -lt "1"}

$correctadapterindex = $correctadapter.InterfaceIndex
Write-Output $correctadapterindex

<#
Set-NetIPInterface -InterfaceIndex $correctadapterindex -DHCP Disabled -PassThru

New-NetIPAddress `
 -AddressFamily IPv4 `
 -InterfaceIndex $correctadapterindex `
 -IPAddress 192.168.50.20 `
 -PrefixLength 24 `
 -DefaultGateway 192.168.50.1

 Set-DnsClientServerAddress `
 -InterfaceIndex $correctadapterindex `
 -ServerAddresses 8.8.8.8,8.8.4.4
#>

$adaptername = $adapter.Name
$adapterindex = $adapter.ifindex

$VersionCodes = @"

Multiple
Lines
AdapterNames: $adaptername
AdapterIndexes: $adapterindex
Of
Information

"@
$VersionCodes

Get-Process | Select-Object -first 1 | format-list -property *

 Get-Process | Select-Object -last 5 | Format-Table -auto `
 @{label="Application"; Expression={$_.Name}; Width=10; Align="Right" }, `
 @{label="Handles"; Expression={$_.HandleCount}; Align="Center"}, `
 @{label="Application Path"; Expression={$_.Path} `
}
 

$RDPRules = Get-NetFirewallRule | Where-Object {$_.DisplayName -match "Remote Desktop" }
$FPRules = Get-NetFirewallRule | Where-Object {$_.DisplayName -match "File and Printer Sharing" }
$WMIRules = Get-NetFirewallRule | Where-Object {$_.DisplayName -match "Windows Management Instrumentation" }

ForEach ($rule in $RDPRules,$FPRules,$WMIRules ) {
    Write-Output $rule.Count
# Set-NetFirewallRule -DisplayName $rule.DisplayName `
# -Direction Inbound `
# -Profile Domain,Private `
# -Action Allow `
# -Enabled True `
# -PassThru
}

$Rules = Get-NetFirewallRule | Where-Object {$_.DisplayName -match "Remote Desktop|File and Printer Sharing|Windows Management Instrumentation" }

ForEach ($rule in $Rules) {
    Write-Output $rule
}

#Enable-PSRemoting -Force

#RFC1918
#10.0.0.0/8
#10.0.0.0        -   10.255.255.255
#172.16.0.0/12
#172.16.0.0      -   172.31.255.255
#192.168.0.0/16 
#192.168.0.0     -   192.168.255.255



