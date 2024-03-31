
<#PSScriptInfo

.VERSION 1.0

.GUID c6775545-aa0b-4b8a-973e-b7ea90729140

.AUTHOR Admin

.COMPANYNAME 

.COPYRIGHT 

.TAGS 

.LICENSEURI 

.PROJECTURI 

.ICONURI 

.EXTERNALMODULEDEPENDENCIES 

.REQUIREDSCRIPTS 

.EXTERNALSCRIPTDEPENDENCIES 

.RELEASENOTES

#>

<# 

.DESCRIPTION 
 install tightvnc 

#> 

# Force using TLS 1.2 connection
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

# Disable the progress bar in Invoke-WebRequest which speeds things up https://github.com/PowerShell/PowerShell/issues/2138
$ProgressPreference = 'SilentlyContinue'

$whoiam = [system.security.principal.windowsidentity]::getcurrent().name
$isElevated = ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")
if ($isElevated) { Write-Output "Running as $whoiam and IS Elevated"; } else { Write-Warning "Running as $whoiam and is NOT Elevated"; }

# Define URL and local file path
$url = "https://www.tightvnc.com/download/2.8.81/tightvnc-2.8.81-gpl-setup-64bit.msi"
$localFilePath = "C:\temp\tightvnc-installer.msi"

# Create the target directory if it doesn't exist
if (-not (Test-Path -Path (Split-Path -Path $localFilePath -Parent))) {
    New-Item -ItemType Directory -Path (Split-Path -Path $localFilePath -Parent) | Out-Null
}

# Download the installer
Invoke-WebRequest -Uri $url -OutFile $localFilePath

$arguments = @(
    "/i",
    "$localFilePath",
    "ALLUSERS=1",
    "/qn",
    "/norestart",
    "ADDLOCAL=Server",
    "SERVER_REGISTER_AS_SERVICE=1",
    "SERVER_ADD_FIREWALL_EXCEPTION=1",
    "SERVER_ALLOW_SAS=1"
)

# Install TightVNC silently
Start-Process -FilePath "msiexec.exe" -ArgumentList $arguments -Wait -NoNewWindow

# Cleanup the installer
Remove-Item -Path $localFilePath -Force

# Get IP Address
Get-NetIPAddress -AddressFamily IPv4 | Where-Object { ($_.IPAddress -notlike "169*") -and ($_.IPAddress -notlike "127*") } | Select-Object InterfaceAlias, IPAddress
