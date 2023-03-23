#Create dummy file, Set size to 1GB and close file.
(New-Object System.IO.FileStream "$pwd\file.txt", 'Create', 'ReadWrite') | ForEach-Object { $_.SetLength(1GB); $_.Close() }

#Create dummy files, Set each to size 1KB. Closes current file before creating the next.
1..1000 | ForEach-Object { (New-Object System.IO.FileStream ".\1kb-testfile-$_.txt", 'Create', 'ReadWrite') | ForEach-Object { $_.SetLength(1KB); $_.Close() } }
