function ipconfig+ {
    $ipconfigOutput = & 'ipconfig' '/all'
    $i = 0
    foreach ($row in $ipconfigOutput) {
        #$i represents the upcoming row used by DNS
        $i++
        if ($row -match "Physical Address|DHCP Server|Description|IPv4 Address|Subnet Mask|Default Gateway|DNS Servers") {
            if ($row -match "Physical Address|Description") {
                Write-Host $row -ForegroundColor Cyan
		    if ($row -match "Physical Address") {
			write-output ""
			}
            } elseif ($row -like "*DNS Servers*") {
                Write-Output $row
                Write-Output $ipconfigOutput[$i]
		    Write-Output ""
            } else {
                Write-Output $row
            }
        }
    }
    Read-Host
}
ipconfig+
