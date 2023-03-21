#Source
https://renenyffenegger.ch/notes/Windows/PowerShell/language/variable/preference/confirmPreference

#####

#Add available commands to variable
$Commands = Get-Command

#Create empty array
$CommandImpactArray = @()

#Oterate through each command
foreach ($Command in $Commands) {
    
    #Try and catch for errors
    try {
        #Get command metadata like ConfirmImpact
        $MetaData = new-object System.Management.Automation.CommandMetadata($Command)
    } catch {
        write-host "error!! - $Command" -ForegroundColor Red
    }
  
    #Create hash object
    $CommandImpactHash = [ordered]@{
        Name        = $Command.Name
        ImpactLevel = $MetaData.ConfirmImpact
    }
  
    #Turn hash object into custom object
    $CustomObjectFromHash = New-Object -TypeName PSObject -Property $CommandImpactHash
    
    #Add custom object to array
    $CommandImpactArray += $CustomObjectFromHash
}

#Parse info into separate lists
$NoneImpactCommands = $CommandImpactArray | Where-Object ImpactLevel -eq "none"
$LowImpactCommands = $CommandImpactArray | Where-Object ImpactLevel -eq "low"
$MediumImpactCommands = $CommandImpactArray | Where-Object ImpactLevel -eq "medium"
$HighImpactCommands = $CommandImpactArray | Where-Object ImpactLevel -eq "high"

#Present sorted lists
$LowImpactCommands | Sort-Object Name
$HighImpactCommands | Sort-Object Name
$NoneImpactCommands | Sort-Object Name



