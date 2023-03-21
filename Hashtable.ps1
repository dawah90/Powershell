#Hash
$hash = @{
    'person' = 'x'
    'datum' = get-date
    'tid' = 'nu'
    'djur' = 'apa'
    'dator' = $env:COMPUTERNAME
}

#OrderedHash
$hash = [ordered]@{
    'person' = 'x'
    'datum' = get-date
    'tid' = 'nu'
    'djur' = 'apa'
    'dator' = $env:COMPUTERNAME
}
