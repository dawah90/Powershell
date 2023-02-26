#Clear console window and previous ChessLine if present.
Clear
if ($ChessLine) {
    Remove-Variable ChessLine
}

#How to reassess your chess 4th edition
#V. Topalov - K. Sasikiran, Sofia 2007 - page 14
$ChessLine = "1.d4 Nf6 2.c4 e6 3.Nc3 Bb4 4.e3 b6 5.Bd3 Bb7 6.Nf3 0-0 7.0-0 d5 8.a3 Bd6 9.cxd5 exd5 10.b4 Nbd7 11.b5 Ne4 12.Bb2 Re8 13.a4 Re6 14.Ne2 a5"

#Split string twice
$splittedString = $ChessLine.Split('.')
$splittedString = $splittedString.Split(' ')

for ($i = 0; $i -le ($ChessLine.Length/3); $i += 3){
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
    Write-Host "" -NoNewLine | Read-Host " "
}

Pause