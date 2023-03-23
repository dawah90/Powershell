#Create dummy file, Set size to 1GB and close file.
(New-Object System.IO.FileStream "$pwd\file.txt", 'Create', 'ReadWrite') | ForEach-Object { $_.SetLength(1GB); $_.Close() }
