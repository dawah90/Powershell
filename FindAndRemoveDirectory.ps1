$FolderToBeDeleted = "C:\Program Files (x86)\HT2000w.9x\SETUP\BDEA"

if (Test-Path -path $FolderToBeDeleted) {
  write-output "folder found. Removing folder"
  Remove-item -Path $FolderToBeDeleted -Recurse -Force
} 
