$fontFiles = Get-ChildItem -Path "C:\temp\Fonts\Current" -File -Recurse -Include @("*.fon", "*.fnt", "*.ttf","*.ttc", "*.otf", "*.mmm", "*.pbf", "*.pfm", "*.pfb")
$CurrentFontFiles = Get-ChildItem -Path "C:\Windows\Fonts"
$NewFonts = @()
$duplicateFonts = @()

foreach ($fontFile in $fontFiles) {
  $duplicate = $CurrentFontFiles | Where-Object {$_.Name -eq $fontFile.Name }
  if ($duplicate) {
    #Write-Host "$fontFile is a duplicate"
    $duplicateFonts += $fontFile.Name  
  } else {
    #Write-Host "$fontFile is new!"
    $NewFonts += $fontFile.Name   
  }
}

Write-Output " "
Write-Output "New fonts:"
$NewFonts
Write-Output " "
Write-Output "Duplicate fonts:"
$duplicateFonts
