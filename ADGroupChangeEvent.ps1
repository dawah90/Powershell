$DomainController = Get-ADDomainController -Filter * | Select-Object -ExpandProperty Name
Write-Host "Searching $DomainController..."
$DSObjectModified = Get-WinEvent -ComputerName $DomainController -LogName Security -MaxEvents 100 | Where-Object { ($_.Id -eq "5136") }

$pattern = '(\w[\w\s]*?)\s*:\s*(\S.*)'
$splitpattern = '^(.*?):\s*(.*)$'

foreach ($DSObject in $DSObjectModified) {
    $TheMessage = $DSObject.Message
    $Rows = @()
    $TheMessage -split "`n" | ForEach-Object { $Rows += $_ }    
    $MatchedRows = @()
    foreach ($row in $rows) {
        
        if ($row -match $pattern) {
            #Write-Output "$row is a match"
            $MatchedRows += $row
        }
    }   
    $MessageResult = @()
    $i = 0
    foreach ($matchedrow in $MatchedRows) {    
        if ($matchedrow -match $splitpattern) {
            $subject = $matches[1].Trim()
            $value = $matches[2].Trim()
            $MessageResult += @{$subject="$value"}
            $i++
            #Write-Output "$i $subject $value"
            
        }

    }
    
    $TargetType = $MessageResult[8].Values
    if ($TargetType -eq "group") {
        $Changer = $MessageResult[1].Values
        $Group = $MessageResult[6].Values
        $ChangeType = $MessageResult[9].Values
        $AffectedUser = $MessageResult[10].Values
        $ChangeAction = $MessageResult[11].Values
        
        if ($ChangeAction -eq "Value Added") {
            Write-Host "$Changer added user '$AffectedUser' to '$Group'" -ForegroundColor Green
        }

        if ($ChangeAction -eq "Value Deleted") {
            Write-Host "$Changer removed user '$AffectedUser' from '$Group'" -ForegroundColor Cyan
        }
    }

}
