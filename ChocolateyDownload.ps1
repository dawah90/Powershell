if (-not (test-path "C:\ProgramData\chocolatey\bin\choco.exe")){
    Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
    choco feature enable -n allowGlobalConfirmation
}

$packages = @(
"notepadplusplus",
"vscode",
"ccleaner",
"greenshot",
"7zip"
)

foreach ($software in $packages){
    choco install $software
}
