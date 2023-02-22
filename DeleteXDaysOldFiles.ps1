Get-ChildItem -Path \\Path -Recurse -File | ? {$_.LastWriteTime -lt (Get-Date).AddDays(-7)} | Remove-Item
