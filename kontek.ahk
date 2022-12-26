^1::
{
    WinActivate "ahk_exe msedge.exe"
    WinWait "ahk_exe msedge.exe"
    WinMaximize
}
^2::
{
    click 530, 405, 1, 1
    sleep 1000
    Send "08:00{tab}"
    Sleep 1000
    Send "16:30"
    Sleep 1000
    click 784, 232, 1, 1
    Sleep 1000
    click 918, 603, 1, 1
}
^3::
{
    click 784, 232, 1, 1
}
