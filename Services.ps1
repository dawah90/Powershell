# Todo: Create a list of ServiceNames and loop through each using ForEach { }. Place while loop inside of ForEach Loop.

$ServiceName = 'ServiceName'
$arrService = Get-Service -Name $ServiceName

while ($arrService.Status -ne 'Running')
{

    Start-Service $ServiceName
    write-host $arrService.status
    write-host 'Service starting'
    Start-Sleep -seconds 20
    $arrService.Refresh()
    if ($arrService.Status -eq 'Running')
    {
        Write-Host 'Service is now Running'
    }
}

$ServiceName = 'ServiceName2'
$arrService = Get-Service -Name $ServiceName

while ($arrService.Status -ne 'Running')
{

    Start-Service $ServiceName
    write-host $arrService.status
    write-host 'Service starting'
    Start-Sleep -seconds 20
    $arrService.Refresh()
    if ($arrService.Status -eq 'Running')
    {
        Write-Host 'Service is now Running'
    }

}

# Get ServiceName if it's stopped and then start it again
Get-Service "ServiceName" | Where {$_.Status -eq 'Stopped'} | Start-Service
Get-Service "ServiceName" | Where {$_.Status -eq 'Stopped'} | Start-Service
