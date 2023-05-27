#Check if services are running and start if not
Get-Service -Name "Display Policy Service" | ForEach-Object { if($_.Status -ne 'Running') { Start-Service -Name $_.Name } }
Get-Service -Name "Display Policy Service" | ForEach-Object { if($_.Status -ne 'Running') { Start-Service -Name $_.Name } }
