function Copy-WithProgress {
    param(
        [string]$sourceDir,
        [string]$destinationDir
    )

    # Calculate total size of files to copy
    $files = Get-ChildItem -Path $sourceDir -Recurse -File
    $totalSize = ($files | Measure-Object -Property Length -Sum).Sum
    $copiedSize = 0

    # Create the destination directory if it does not exist
    if (-not (Test-Path -Path $destinationDir)) {
        New-Item -ItemType Directory -Path $destinationDir | Out-Null
    }

    foreach ($file in $files) {
        $sourceFilePath = $file.FullName
        $destinationFilePath = $sourceFilePath.Replace($sourceDir, $destinationDir)

        # Ensure destination subdirectory exists
        $destinationFileDir = [System.IO.Path]::GetDirectoryName($destinationFilePath)
        if (-not (Test-Path -Path $destinationFileDir)) {
            New-Item -ItemType Directory -Path $destinationFileDir | Out-Null
        }

        # Copy the file
        Copy-Item -Path $sourceFilePath -Destination $destinationFilePath

        # Update progress
        $copiedSize += $file.Length
        $progress = ($copiedSize / $totalSize) * 100
        Write-Progress -Activity "Copying files..." -Status "$([Math]::Round($progress, 2))% Complete" -PercentComplete $progress
    }
}

# Usage example
Copy-WithProgress -sourceDir "C:\temp\source\Questie" -destinationDir "C:\temp\dest\Questie"
