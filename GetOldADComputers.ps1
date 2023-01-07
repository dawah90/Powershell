#Get all computers that have been inactive for over 180 days and are still enabled
$SomeTimeAgo = (Get-Date).AddDays(-180)
$InactiveComputers = Get-ADComputer -SearchBase "OU=Workstations,DC=LKNET,DC=LOCAL" -Properties lastLogonDate -Filter { (lastLogonDate -lt $SomeTimeAgo -and Enabled -eq "True") } 
$InactiveComputers | Format-Table DistinguishedName
