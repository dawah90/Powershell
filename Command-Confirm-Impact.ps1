https://renenyffenegger.ch/notes/Windows/PowerShell/language/variable/preference/confirmPreference

$stopProcMeta = new-object System.Management.Automation.CommandMetadata(get-command stop-process)
$stopProcMeta.ConfirmImpact

$Commands = Get-Command | Select-Object 50
$ImpactHash = @{}
$ErrorLog = "C:\temp\ConfirmImpactError.log"  

foreach ($Command in $Commands) {    
$MetaData = new-object System.Management.Automation.CommandMetadata(get-command $Command)    
  Try {        
    $ImpactHash.Add("$($Command.Name)","$($MetaData.ConfirmImpact)")    
  } Catch {        
    Add-Content -Value $Error[0] -Path $ErrorLog    
    }
}  
$ImpactHash

