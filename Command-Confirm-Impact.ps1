https://renenyffenegger.ch/notes/Windows/PowerShell/language/variable/preference/confirmPreference

$stopProcMeta = new-object System.Management.Automation.CommandMetadata(get-command stop-process)
$stopProcMeta.ConfirmImpact
