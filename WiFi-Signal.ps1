clear-host; while ($true) { (netsh wlan show interfaces) -Match '^\s+Signal' -Replace '^\s+Signal\s+:\s+',''; Start-Sleep -Seconds 1 }
