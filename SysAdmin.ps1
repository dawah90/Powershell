<#
1. -Detailed: The Detailed parameter gives you the command
SYNTAX, PARAMETERS, ALIASES, and REMARKS.
2. -Full: The Full gives similar information provided by the Detailed
parameter with more information about each parameter
3. -Examples: Gives examples of how to use the Cmdlet. This can be
very useful if you have never used the Cmdlet before.
4. -Online: Opens the online help page of the Cmdlet.
5. -Window: Open the online help page in a window.

VS Code - 
Highlight Get-Event + CTRL+F1 = Get-Event -Online
#>

Get-Help Get-Event -ShowWindow
Get-Help Get-Event -Online

Get-ChildItem C:\Temp
Get-ChildItem C:\Temp -Recurse

Get-ChildItem C:\Temp -Recurse | Measure-Object -Property Length -Sum
Get-ChildItem C:\Temp -Recurse -File | Measure-Object -Property Length -Sum | Select-Object -Property Sum 
Get-ChildItem C:\Temp -Recurse -File | Measure-Object -Property Length -Sum | Select-Object -Property @{n='Size (GB)';e={$_.Sum/1GB}}
Get-ChildItem C:\Temp -Recurse -File | Measure-Object -Property Length -Sum | Select-Object -Property @{n='Size (GB)';e={[Math]::Round($_.Sum/1GB, 3)}}

Get-ChildItem C:\Temp -Recurse -File | Measure-Object -Property Length -Sum | Select-Object -Property @{n='Size (MB)';e={[Math]::Round($_.Sum/1MB, 2)}}

#Count Files
Get-ChildItem C:\Temp -Recurse -File | Measure-Object -Line | Select-Object -Property @{n='Files';e={$_.Lines}}
#Count Directories
Get-ChildItem C:\Temp -Recurse -Directory | Measure-Object -Line | Select-Object -Property @{n='Directories';e={$_.Lines}}

#Get all files and age. 
Get-ChildItem C:\Temp -Recurse -File | Select-Object -Property FullName, CreationTime

#Return all files older than 7 days
Get-ChildItem C:\Temp -Recurse -File | Where-Object { $_.CreationTime -lt (Get-Date).AddDays(-7)} | Select-Object -Property FullName, CreationTime 
#Return all files older than 1 hour
Get-ChildItem C:\Temp -Recurse -File | Where-Object { $_.CreationTime -lt (Get-Date).AddHours(-1)} | Select-Object -Property FullName, CreationTime 

#Return all files older than 1 hour
Get-ChildItem C:\Temp -Recurse -File | Where-Object { $_.CreationTime -lt (Get-Date).AddHours(-1)} | Select-Object -Property FullName, CreationTime 

#Return all files older than 1 hour and copy to archive folder
$Archive = "C:\_Tools\Archive"
Get-ChildItem C:\Temp -Recurse -File | Where-Object { $_.CreationTime -lt (Get-Date).AddHours(-1)} | Copy-Item -Destination $Archive

#Rename each files in Archive. Add "Archive_" to each file
Get-ChildItem $Archive | ForEach-Object { Rename-Item -Path $_.FullName -NewName "Archive_$($_.Name)" }

#Export Get-Command -Verb to a .CSV-file
Get-Command -Verb Export | Select-Object Name, CommandType, Version, Source | Export-Csv -NoTypeInformation -Path C:\Temp\ExportCommands.csv
Get-Command -Verb Export | Select-Object Name, CommandType, Version, Source | Out-File C:\Temp\ExportCommands.txt

############### Processes ##############

Get-Process | Sort-Object CPU -Descending
Get-Process | Where-Object { $_.PM -ge 100000000} | Sort-Object PM -Descending
Get-Process | Where-Object { $_.CPU -ge 10} | Sort-Object CPU -Descending

############## Events ##################

Get-EventLog -LogName Application | Select-Object -First 20
Get-EventLog -LogName System | Select-Object -First 20
Get-EventLog -LogName Security | Select-Object -First 20
Get-EventLog -LogName 'Cisco AnyConnect Secure Mobility Client' | Select-Object -First 20

############## PSSession ###############

Enter-PSSession Computer1
Exit-PSSession

Invoke-Command -ComputerName Computer1, Computer2, Computer3, -ScriptBlock {Get-Process}

#Storing the result in a variable makes for easy data manipulation.
$session = New-PSSession -ComputerName Computer1, Computer2
Invoke-Command -Session $session # { $Processes = Get-Process}






