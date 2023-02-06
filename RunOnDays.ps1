$datetime=[datetime]::Today
if($datetime.DayOfWeek -match 'Monday|Wednesday|Friday'){
    Write-Output "m-w-f"
}elseif($datetime.DayOfWeek -match 'Tuesday|Thursday|Saturday'){
    Write-Output "t-t-s"
}else{
    Write-Output "its sunday"
}

$datetime | Get-Member