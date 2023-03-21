$DCSession = New-PSSession -ComputerName "xyz"
$DCSession  
 
Get-Module -PSSession $DC Session -ListAvailable
Import-Module -PSSession $DCSession -Name ActiveDirectory -Prefix "fjarran"  

Get-fjarranADUser -Filter *  

$DCSession | Remove-PSSession 
