Remove-Variable string

#HardCoded
$string = "1.d4 Nf6 2.c4 e6 3.Nc3 Bb4 4.e3 b6 5.Bd3 Bb7 6.NB 0-0 7.0-0 d5 8.a3 Bd6 9.cxd5 exd5 10.b4 Nbd7 11.b5 Ne4 12.Bb2 Re5 13.a4 Re6 14.Ne2 a5"
#Copy-Paste
if (-not ($string)) {
    $string = Read-host "Copy-paste line"
}

#Split string twice
$splittedString = $string.Split('.')
$splittedString = $splittedString.Split(' ')

for ($i = 0; $i -le ($string.Length/3); $i += 3){
    $MoveNum = $splittedString[$i]
    if (-Not ($MoveNum)){
        Break
    }
    $WhitesMove = $splittedString[$i+1]
    $BlacksMove = $splittedString[$i+2]
    Write-host "$MoveNum`: " -NoNewline
    Write-Host "$WhitesMove" -ForegroundColor Green -NoNewline
    Write-Host " - " -NoNewline
    Write-Host "$BlacksMove" -ForegroundColor Cyan -NoNewline
    Write-Host ""
}