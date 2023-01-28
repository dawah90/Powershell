$Defender = Get-MpPreference
$ruleId = $Defender.AttackSurfaceReductionRules_Ids
$ruleIdAndAction = @()
for ($i = 0; $i -le $ruleId.Count-1; $i++) {
$action = $Defender.AttackSurfaceReductionRules_Actions[$i]
$ruleIdAndAction += $ruleId[$i] + " : " + $action
}
Write-output $ruleIdAndAction
