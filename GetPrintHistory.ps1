#StartTime - Modify AddDays(-7) for 1 week ago or change to AddHours(-1) for 1 hour ago
$StartTime = (Get-Date).AddDays(-1)
$EndTime = (Get-Date)
$Results = Get-WinEvent -FilterHashTable @{LogName="Microsoft-Windows-PrintService/Operational"; ID=307; StartTime=$StartTime; EndTime=$EndTime;}
$i = 0

foreach ($result in $Results) {
    $i += 1
    $PrintTime = $Result.TimeCreated
    $Message = $Result.Message
    $MessageSplitted = $Message.Split(' ')
    $MessagePrintedOnStart = $Message.IndexOf('printed on')
    $MessagePrintedOnStop = $Message.IndexOf('. ')
    $MessagePagesPrintedStart = $Message.IndexOf('printed:')
    $MessagePrintedOnLength = $MessagePrintedOnStop - $MessagePrintedOnStart
    
    $PrintedOn = $Message.Substring($MessagePrintedOnStart, $MessagePrintedOnLength)
    $PagesPrinted = $Message.Substring($MessagePagesPrintedStart+8, 4)
    
    Write-Host "Entry #$i - $PrintTime - $PrintedOn - Pages:$PagesPrinted" -ForegroundColor Cyan
}
