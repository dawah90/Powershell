# Check if the PowerShell session is running with elevated privileges
 if (-NOT ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator))
 {
   Write-Host "This script requires elevated privileges. Please run PowerShell as an Administrator." -ForegroundColor Red
   exit
 }

 # Disable the Windows Management Instrumentation (WMI) service
 Set-Service -Name winmgmt -StartupType Disabled

 # Stop the WMI service, forcing the stop if necessary
 Stop-Service -Name winmgmt -Force

 # Change directory to the WMI repository in system32\wbem
 Set-Location -Path $env:windir\system32\wbem

 # Register all DLL files in the current directory
 Get-ChildItem -Path .\*.dll | ForEach-Object { 
   Start-Process regsvr32 -ArgumentList "/s", $_.FullName -Wait 
 }

 # Register the WMI service
 Start-Process wmiprvse -ArgumentList "/regserver" -Wait

 # Set the WMI service to automatic start
 Set-Service -Name winmgmt -StartupType Automatic

 # Start the WMI service
 Start-Service -Name winmgmt

 # Compile all MOF and MFL files in the directory and subdirectories
 Get-ChildItem -Path .\ -Include *.mof, *.mfl -Recurse | ForEach-Object { 
   mofcomp $_.FullName 
 }
