if (-not (test-path "C:\ProgramData\chocolatey\bin\choco.exe")){
    Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
    choco feature enable -n allowGlobalConfirmation
    choco feature disable -n showdownloadprogress
}

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
    ("openssl.light", ""),
    ("wireshark", ""),
    ("everything", ""),
    ("postman", ""),
    ("youtube-dl", ""),
    ("psexec", ""),
    ("choco install desktopinfo", ""),
    ("discord.install", ""),
    ("nmap", ""),
    ("steam", "")
)

$NumberOfPackages = $packages.length

foreach ($item in $packages){
    if ($item[1] -ne ("")) {
       $PackageNumber = $packages.IndexOf($item)+1
       Write-Output "Installing $PackageNumber/$NumberOfPackages"
       choco install $item[0] --params $item[1]
    } else {
       $PackageNumber = $packages.IndexOf($item)+1
       Write-Output "Installing $PackageNumber/$NumberOfPackages"
       choco install $item
    }
}

$endTime = Get-Date
$timeDiff = $endTime - $startTime

#Time it took to run script
$timeDiff.ToString("mm\:ss")
