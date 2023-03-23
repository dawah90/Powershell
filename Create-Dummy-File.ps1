#Create dummy file
(New-Object System.IO.FileStream "$pwd\file.txt", Create, ReadWrite).SetLength(100MB)
