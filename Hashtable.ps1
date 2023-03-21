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
$obj = New-Object -TypeName PSObject -Property $hash

#UsableHash
$hash = [pscustomobject]@{
    'person' = 'x'
    'datum' = get-date
    'tid' = 'nu'
    'djur' = 'apa'
    'dator' = $env:COMPUTERNAME
}
