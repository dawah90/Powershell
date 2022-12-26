if (Get-ExecutionPolicy | Where-Object ($_.Status -ne "Unrestricted")) {
    write-output "Executionpolicy is not Unrestricted"
} else {
    Write-Output "ExecutionPolicy is set to unrestricted"
}

#Remove progress bar to increase download speed
$ProgressPreference = 'SilentlyContinue'
$SoftwareFolder = "C:\temp\software"

#Create folder if it doesn't already exists
if (-not (Test-Path $SoftwareFolder))
{
    New-Item -Path $SoftwareFolder -ItemType Directory
}

$software = @(
#("SoftwareName", "Software download URL", "Software download location", "Silent Install parameters"),
("7zip","https://www.7-zip.org/a/7z2201-x64.exe","C:\temp\software\7z2201-x64.exe","/S"),
#("CCleaner","https://bits.avcdn.net/productfamily_CCLEANER/insttype_FREE/platform_WIN_PIR/installertype_ONLINE/build_RELEASE","C:\temp\software\CCleaner.exe","/S"),
#("Greenshot","https://github.com/greenshot/greenshot/releases/download/Greenshot-RELEASE-1.2.10.6/Greenshot-INSTALLER-1.2.10.6-RELEASE.exe","C:\temp\software\Greenshot.exe","/VERYSILENT /NORESTART"),
("Notepad++","https://github.com/notepad-plus-plus/notepad-plus-plus/releases/download/v8.4.8/npp.8.4.8.Installer.x64.exe","C:\temp\software\Notepad++.exe","/S"),
("Visual Studio Code","https://code.visualstudio.com/sha/download?build=stable&os=win32-x64","C:\temp\software\VisualStudioCode.exe","/VERYSILENT /NORESTART")
)

foreach ($row in $software) 
{
    if (-not (test-path $row[2])) {
    $downloadtext = "Downloading"
    $downloadString = "{0} {1}" -f $downloadtext, $row[0]
    Write-Output $downloadString
    #Invoke-WebRequest -Uri $row[1] -OutFile $row[2]
    } else {
    $foundtext = "already downloaded"
    $foundString = "{0} {1}" -f $row[0], $foundtext
    Write-Output $foundString
    }
}

foreach ($row in $software)
{
    $installString = "{0} {1}" -f $row[2], $row[3]
    $installing = "Installing"
    $installtext = "{0} {1}" -f $installing, $row[0]
    Write-Output $installtext
    #Start-Process -FilePath $row[2] -ArgumentList $row[3] -Wait
}
