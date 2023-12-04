$WiFiPasswords = cmd.exe /c "for /f ""skip=9 tokens=1,2 delims=:"" %i in ('netsh wlan show profiles') do @if ""%j"" NEQ """" (echo SSID: %j & netsh wlan show profiles %j key = clear | findstr ""Content"")"

# Split the text into lines
$lines = $WiFiPasswords -split "`n"

# Initialize an empty array
$ssidArray = @()

# Temporary variables
$currentSSID = $null
$currentKey = $null

foreach ($line in $lines) {
    if ($line -match "SSID: (.+)") {
        # If we already have an SSID and a Key, add them to the array
        if ($currentSSID -and $currentKey) {
            $ssidArray += "$currentSSID`: $currentKey"
        }

        # Update current SSID
        $currentSSID = $matches[1].Trim()
        $currentKey = $null # Reset the key for the new SSID
    }
    elseif ($line -match "Key Content\s+:\s+(.+)") {
        # Update current Key Content
        $currentKey = $matches[1].Trim()
    }
}

# Add the last SSID and Key Content to the array if they exist
if ($currentSSID -and $currentKey) {
    $ssidArray += "$currentSSID`: $currentKey"
}

# Output the array
$ssidArray
