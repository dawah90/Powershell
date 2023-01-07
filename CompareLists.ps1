#Compare 2 AD-users group membership

$User1 = Read-Host "Enter user 1"
$User2 = Read-Host "Enter user 2"

$list1 = Get-ADPrincipalGroupMembership -Identity $User1 | Select-Object -Property name
$list2 = Get-ADPrincipalGroupMembership -Identity $User2 | Select-Object -Property name
$list1Names = $list1.name
$list2Names = $list2.name

# Find the items that are common to both lists
$common = $list1Names | Where-Object {$list2Names -contains $_}

# Find the items that are unique to each list
$unique1 = $list1Names | Where-Object {$list2Names -notcontains $_}
$unique2 = $list2Names | Where-Object {$list1Names -notcontains $_}

Write-Output " "
Write-Host "Common for both users" -ForegroundColor Cyan
Write-Output $common
Write-Output " "
Write-Host "Unique for $user1" -ForegroundColor Cyan
Write-Output $unique1
Write-Output " "
Write-Host "Unique for $user2" -ForegroundColor Cyan
Write-Output $unique2