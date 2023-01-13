#Start-Transcript -Path "C:\transcripts\RecreateShortcutsV1.txt" -NoClobber

##WORD
$fileToCheck = "C:\Program Files\Microsoft Office\root\Office16\WINWORD.EXE"
if (Test-Path $fileToCheck -PathType leaf)
{
    $SourceFilePath = $fileToCheck
    $ShortcutPath = "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Word.lnk"
    $WScriptObj = New-Object -ComObject ("WScript.Shell")
    $shortcut = $WscriptObj.CreateShortcut($ShortcutPath)
    $shortcut.TargetPath = $SourceFilePath
    Write-Output $ShortcutPath
    $shortcut.Save()
} else {
"App not installed"
}

##EXCEL
$fileToCheck = "C:\Program Files\Microsoft Office\root\Office16\EXCEL.EXE"
if (Test-Path $fileToCheck -PathType leaf)
{
    $SourceFilePath = $fileToCheck
    $ShortcutPath = "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Excel.lnk"
    $WScriptObj = New-Object -ComObject ("WScript.Shell")
    $shortcut = $WscriptObj.CreateShortcut($ShortcutPath)
    $shortcut.TargetPath = $SourceFilePath
    Write-Output $ShortcutPath
    $shortcut.Save()
} else {
"App not installed"
}

##OUTLOOK
$fileToCheck = "C:\Program Files\Microsoft Office\root\Office16\OUTLOOK.EXE"
if (Test-Path $fileToCheck -PathType leaf)
{
    $SourceFilePath = $fileToCheck
    $ShortcutPath = "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Outlook.lnk"
    $WScriptObj = New-Object -ComObject ("WScript.Shell")
    $shortcut = $WscriptObj.CreateShortcut($ShortcutPath)
    $shortcut.TargetPath = $SourceFilePath
    Write-Output $ShortcutPath
    $shortcut.Save()
} else {
    "App not installed"
}

##OneNote
$fileToCheck = "C:\Program Files\Microsoft Office\root\Office16\ONENOTE.EXE"
if (Test-Path $fileToCheck -PathType leaf)
{
    $SourceFilePath = $fileToCheck
    $ShortcutPath = "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\OneNote.lnk"
    $WScriptObj = New-Object -ComObject ("WScript.Shell")
    $shortcut = $WscriptObj.CreateShortcut($ShortcutPath)
    $shortcut.TargetPath = $SourceFilePath
    Write-Output $ShortcutPath
    $shortcut.Save()
} else {
    "App not installed"
}

##OneDrive
$fileToCheck = "C:\Program Files\Microsoft Office\root\Office16\OneDrive.exe"
if (Test-Path $fileToCheck -PathType leaf)
{
    $SourceFilePath = $fileToCheck
    $ShortcutPath = "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\OneDrive.lnk"
    $WScriptObj = New-Object -ComObject ("WScript.Shell")
    $shortcut = $WscriptObj.CreateShortcut($ShortcutPath)
    $shortcut.TargetPath = $SourceFilePath
    Write-Output $ShortcutPath
    $shortcut.Save()
} else {
    "App not installed"
}

##Outlook
$fileToCheck = "C:\Program Files\Microsoft Office\root\Office16\OUTLOOK.exe"
if (Test-Path $fileToCheck -PathType leaf)
{
    $SourceFilePath = $fileToCheck
    $ShortcutPath = "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Outlook.lnk"
    $WScriptObj = New-Object -ComObject ("WScript.Shell")
    $shortcut = $WscriptObj.CreateShortcut($ShortcutPath)
    $shortcut.TargetPath = $SourceFilePath
    Write-Output $ShortcutPath
    $shortcut.Save()
} else {
    "App not installed"
}
##PowerPoint
$fileToCheck = "C:\Program Files\Microsoft Office\root\Office16\POWERPNT.exe"
if (Test-Path $fileToCheck -PathType leaf)
{
    $SourceFilePath = $fileToCheck
    $ShortcutPath = "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\PowerPoint.lnk"
    $WScriptObj = New-Object -ComObject ("WScript.Shell")
    $shortcut = $WscriptObj.CreateShortcut($ShortcutPath)
    $shortcut.TargetPath = $SourceFilePath
    Write-Output $ShortcutPath
    $shortcut.Save()
} else {
    "App not installed"
}
##VISIO
$fileToCheck = "C:\Program Files\Microsoft Office\root\Office16\VISIO.exe"
if (Test-Path $fileToCheck -PathType leaf) {
    $SourceFilePath = $fileToCheck
    $ShortcutPath = "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Visio.lnk"
    $WScriptObj = New-Object -ComObject ("WScript.Shell")
    $shortcut = $WscriptObj.CreateShortcut($ShortcutPath)
    $shortcut.TargetPath = $SourceFilePath
    Write-Output $ShortcutPath
    $shortcut.Save()
} else {
    "App not installed"
}

##Citrix Workspace
$fileToCheck = "C:\Program Files (x86)\Citrix\ICA Client\SelfServicePlugin\SelfService.exe"
if (Test-Path $fileToCheck -PathType leaf) {
    $SourceFilePath = $fileToCheck
    $ShortcutPath = "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Citrix Workspace.lnk"
    $WScriptObj = New-Object -ComObject ("WScript.Shell")
    $shortcut = $WscriptObj.CreateShortcut($ShortcutPath)
    $shortcut.TargetPath = $SourceFilePath
    Write-Output $ShortcutPath
    $shortcut.Save()
} else {
    "App not installed"
}

##Edge
$fileToCheck = "C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe"
if (Test-Path $fileToCheck -PathType leaf) {
    $SourceFilePath = $fileToCheck
    $ShortcutPath = "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Edge.lnk"
    $WScriptObj = New-Object -ComObject ("WScript.Shell")
    $shortcut = $WscriptObj.CreateShortcut($ShortcutPath)
    $shortcut.TargetPath = $SourceFilePath
    Write-Output $ShortcutPath
    $shortcut.Save()
} else {
    "App not installed"
}