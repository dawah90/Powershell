$pc = qwinsta /server:localhost | select-string "Disc" | select-string -notmatch "services"

if ($pc)
{
  $pc| % { 

  logoff ($_.tostring() -split ' +')[2] /server:localhost

  }
}
