# Piping a script's content to Invoke-Expression can bypass execution policy restrictions because the command isn't technically running a script file; it's executing a string of commands.

powershell.exe -command "Get-Content 'Scriptfile.ps1' -Raw | Invoke-Expression"
