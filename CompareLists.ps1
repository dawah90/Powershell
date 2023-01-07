# Define the two lists
$list1 = 1, 2, 3, 4, 5
$list2 = 3, 4, 5, 6, 7

# Find the items that are common to both lists
$common = $list1 | Where-Object {$list2 -contains $_}

# Find the items that are unique to each list
$unique1 = $list1 | Where-Object {$list2 -notcontains $_}
$unique2 = $list2 | Where-Object {$list1 -notcontains $_}

# Create the table
$table = @{
    "Unique to list 1" = $unique1
    "Common" = $common
    "Unique to list 2" = $unique2
}

# Output the table
$table | Format-Table