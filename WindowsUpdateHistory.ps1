if (Get-PackageProvider | Where-Object { $_.Name -eq "nuget" }) {
    Write-Output "Nuget already installed" }
    else {
    Write-Output "Installing Nuget..."
    Install-PackageProvider nuget -force
    }

if (Get-Module | Where-Object { $_.Name -eq "PSWindowsUpdate" }) {
    Write-Output "PSWindowsUpdate Already installed" }
    else {
    Write-Output "Installing Module PSWindowsUpdate..."
    Install-Module -Name PSWindowsUpdate -Force
    }

$WUHistory = Get-WUHistory -Last 100
$WUHistory | Where-Object { $_.Result -eq "Succeeded" -and $_.KB -ne "KB2267602" -and $_.KB.Length -gt 0 } | format-table -Property Date, KB, Title
