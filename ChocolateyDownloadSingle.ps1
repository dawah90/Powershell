if (-not (test-path "C:\ProgramData\chocolatey\bin\choco.exe")){
    Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
    choco feature enable -n allowGlobalConfirmation
    choco feature disable -n showdownloadprogress
    Clear-Host
}

$startTime = Get-Date

#Packages can be found here: https://community.chocolatey.org/packages

#Example: choco install Firefox --params "/NoTaskbarShortcut /NoDesktopShortcut"
choco install Firefox --params "/NoTaskbarShortcut /NoDesktopShortcut"

$endTime = Get-Date
$timeDiff = $endTime - $startTime
$timeInMinutes = $timeDiff.ToString("mm\:ss")
Write-Output "Completion time: $timeInMinutes"
