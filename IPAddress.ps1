#$NetAdapter = Get-NetAdapter | Format-list
$NetworkCard = Get-NetIPAddress | Where-Object {$_.AddressFamily -eq "IPv4" -and $_.InterfaceAlias -eq "Ethernet"}
$IPAddress = $NetworkCard.IPAddress
$IPAddress

