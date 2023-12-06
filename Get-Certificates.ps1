$CertName = "danwah"
$CUCertsPath = "Cert:\CurrentUser\"
$LMCertsPath = "Cert:\LocalMachine\"
$CUCerts = Get-ChildItem -Path $CUCertsPath
$LMCerts = Get-ChildItem -Path $LMCertsPath

Write-Host "CurrentUser" -BackgroundColor Cyan

ForEach ($CertStore in $CUCerts) {
    $CertStoreName = $CertStore.Name
    Write-Host "$CertStoreName" -BackgroundColor Yellow
    Get-ChildItem -Path "$CUCertsPath\$CertStoreName" | Where-Object { $_.Issuer -like "*$CertName*" } | Select-Object Subject, NotBefore, NotAfter | Sort-Object NotBefore -Descending
}

Write-Host "LocalComputer" -BackgroundColor Cyan

ForEach ($CertStore in $LMCerts) {
    $CertStoreName = $CertStore.Name
    Write-Host "$CertStoreName" -BackgroundColor Yellow
    Get-ChildItem -Path "$LMCertsPath\$CertStoreName" -ErrorAction SilentlyContinue | Where-Object { $_.Issuer -like "*CertName*" } | Select-Object Subject, NotBefore, NotAfter | Sort-Object NotBefore -Descending
}
