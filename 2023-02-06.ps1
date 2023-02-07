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





