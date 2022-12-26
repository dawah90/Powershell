if (-not (test-path "C:\ProgramData\chocolatey\bin\choco.exe")){
    Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
    choco feature enable -n allowGlobalConfirmation
}

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
    ("steam", ""),
    ("speccy", "")
)

foreach ($item in $packages){
    if ($item[1] -ne ("")) {
       choco install $item[0] --params $item[1]
    } else {
       choco install $item
    }
}
