if (-not (test-path "C:\ProgramData\chocolatey\bin\choco.exe")){
    Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
    choco feature enable -n allowGlobalConfirmation
    choco feature disable -n showdownloadprogress
    Clear-Host
}

$LogFile = "C:\ChocolateyInstall.log"
$startTime = Get-Date

$packages = @(
    #("Package name", "Optional parameters"),
    ("notepadplusplus", ""),
    ("vscode", ""),
    ("Firefox", "/NoTaskbarShortcut /NoDesktopShortcut /NoAutoUpdate"),
    ("ccleaner", ""),
    ("greenshot", ""),
    ("7zip", ""),
    ("adobereader", "'/UpdateMode:4'" ),
    ("vcredist140", ""),
    ("vlc", ""),
    ("teamviewer", ""),
    ("sysinternals", ""),
    ("autohotkey.portable", ""),
    ("putty.install", ""),
    ("treesizefree", ""),
    ("curl", ""),
    ("winscp.install", ""),
    ("keepass.install", ""),
    ("googledrive", ""),
    ("openssl.light", ""),
    ("wireshark", ""),
    ("everything", ""),
    ("postman", ""),
    ("youtube-dl", ""),
    ("psexec", ""),
    ("desktopinfo", ""),
    ("discord.install", ""),
    ("nmap", ""),
    ("steam", "")
)

$NumberOfPackages = $packages.length

foreach ($item in $packages){
    if ($item[1] -ne ("")) {
        $InstallStartTime = Get-Date
        $PackageNumber = $packages.IndexOf($item)+1
        Write-Output "Installing $PackageNumber/$NumberOfPackages - $item[0]"
        choco install $item[0] --params $item[1]
        $InstallEndTime = Get-Date
        $InstalltimeDiff = $InstallendTime - $installstartTime
        "$($InstalltimeDiff.ToString("mm\:ss")) - $item[0]" | Out-File -FilePath $LogFile -Append
        Clear-Host
    } else {
        $InstallStartTime = Get-Date
        $PackageNumber = $packages.IndexOf($item)+1
        Write-Output "Installing $PackageNumber/$NumberOfPackages - $item"
        choco install $item
        $InstallEndTime = Get-Date
        $InstalltimeDiff = $InstallendTime - $installstartTime
        "$($InstalltimeDiff.ToString("mm\:ss")) - $item" | Out-File -FilePath $LogFile -Append
        Clear-Host
    }
}

$endTime = Get-Date
$timeDiff = $endTime - $startTime
$timeInMinutes = $timeDiff.ToString("mm\:ss")

Write-Output "Completion time: $timeInMinutes"
