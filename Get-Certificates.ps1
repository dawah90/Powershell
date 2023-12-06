$CUCerts = Get-ChildItem -Path Cert:\CurrentUser\
$LMCerts = Get-ChildItem -Path Cert:\LocalMachine\

Write-Host "CurrentUser" -BackgroundColor Cyan

ForEach ($CertStore in $CUCerts) {
    $CertStoreName = $CertStore.Name
    Write-Host "$CertStoreName" -BackgroundColor Yellow
    Get-ChildItem -Path "$CUCerts\$CertStoreName" | Where-Object { $_.Issuer -like "*Cert*" } | Select-Object Subject, NotBefore, NotAfter | Sort-Object NotBefore -Descending
}

Write-Host "LocalComputer" -BackgroundColor Cyan

ForEach ($CertStore in $LMCerts) {
    $CertStoreName = $CertStore.Name
    Write-Host "$CertStoreName" -BackgroundColor Yellow
    Get-ChildItem -Path "$LMCerts\$CertStoreName" -ErrorAction SilentlyContinue | Where-Object { $_.Issuer -like "*Cert*" } | Select-Object Subject, NotBefore, NotAfter | Sort-Object NotBefore -Descending
}
