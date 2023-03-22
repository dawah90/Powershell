(Get-ChildItem -Path "C:\Program Files (x86)\Microsoft Office\root\Office16\Outlook.exe" | Select-Object -Expandproperty VersionInfo).ProductVersion
(Get-ChildItem -Path "C:\Program Files\Microsoft Office\root\Office16\Outlook.exe" | Select-Object -Expandproperty VersionInfo).ProductVersion
