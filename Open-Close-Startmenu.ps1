# Open start menu, wait 2 seconds, then close start menu again.

Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.SendKeys]::SendWait('^{ESC}')
start-sleep -Seconds 2
[System.Windows.Forms.SendKeys]::SendWait('^{ESC}')
