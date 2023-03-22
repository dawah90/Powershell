#Define variables
$RegKey = "HKLM:\SOFTWARE\Microsoft\Office\ClickToRun\Configuration"
$RegKeyName = "CDNBaseUrl"
$RegKeyValue = "http://officecdn.microsoft.com/pr/492350f6-3a01-4f97-b9c0-c7c6ddf67d60"

#Office Channel Recon
$Office365Channel = Get-ItemProperty -Path $RegKey -Name $RegKeyName
$Computer = $env:COMPUTERNAME

switch ($($Office365Channel).CDNBaseUrl) {
	'http://officecdn.microsoft.com/pr/55336b82-a18d-4dd6-b5f6-9e5095c314a6' { "$Computer is running Monthly Enterprise Channel";$CorrectChannel = $false }
	'http://officecdn.microsoft.com/pr/492350f6-3a01-4f97-b9c0-c7c6ddf67d60' { "$Computer is running Current Channel";$CorrectChannel = $true }
	'http://officecdn.microsoft.com/pr/64256afe-f5d9-4f86-8936-8840a6a4f5be' { "$Computer is running Current Channel (preview)";$CorrectChannel = $false }
	'http://officecdn.microsoft.com/pr/7ffbc6bf-bc32-4f92-8982-f9dd17fd3114' { "$Computer is running Semi-Annual Enterprise Channel";$CorrectChannel = $false }
	'http://officecdn.microsoft.com/pr/b8f9b850-328d-4355-9145-c59439a0c4cf' { "$Computer is running Semi-Annual Enterprise Channel (preview)";$CorrectChannel = $false }
	'http://officecdn.microsoft.com/pr/5440fd1f-7ecb-4221-8110-145efaa6372f' { "$Computer is running Beta Channel";$CorrectChannel = $false }
}

if (-not ($CorrectChannel)) {
    Write-Output "Recommend change to current channel"
} else {
    Write-Output "No need to change anything"
}

#Change office channel to current channel
if (-not ($CorrectChannel)) {
    Write-Output "Setting $RegkeyName to $RegKeyValue"
    Set-ItemProperty -Path $RegKey -Name $RegKeyName -Value $RegKeyValue
} else {
    Write-Output "$RegKeyValue is already set"
}
