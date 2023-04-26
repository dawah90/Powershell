## Checks for admin role
If (-NOT ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {    
## Starts the script again with the given admin credentials
    Start-Process -FilePath PowerShell.exe -verb runas -ArgumentList "-ExecutionPolicy Bypass -NoExit -nologo" ,$myinvocation.mycommand.definition
    Break
}
