<#

Version 1.0.0 

Run from C:\temp

#>

function Get-TimeStamp {
    return "[{0:dd/MM/yy} {0:HH:mm:ss}]" -f (Get-Date)   
}

# Specifies what companies to check
$Companies = @("030","031","032","050","060")

foreach ($companyID in $companies)
{
    Write-Output "$(Get-TimeStamp) Renaming all invoices inside folder $companyID\PDFArchive" | Out-File C:\temp\logfile.txt -append

    $srcRoot = "C:\temp\Monitor\ExtFiles\$companyID\PDFArchive"
    $dstRoot = "C:\temp\FTP\$companyID"

    # Rename all invoice files to the Invoice number
    $fileList = Get-ChildItem -Path $srcRoot -File -Force -Recurse
    foreach ($file in $fileList)
    {
        $fileName = $file.Name
        $pos1 = $fileName.IndexOf("[")
        $pos2 = $fileName.IndexOf("]") 
        $InvoiceLength = $pos2-1 - $pos1

        $InvoiceNumber = $file.BaseName.Substring($pos1+1,$invoicelength)
        Rename-Item -LiteralPath $($file.FullName) -NewName "$InvoiceNumber.pdf"
    }

    Write-Output "$(Get-TimeStamp) Sorting files for $companyID" | Out-File C:\temp\logfile.txt -append

    # Move invoices to sub folders based on invoice number
    $fileList = Get-ChildItem -Path $srcRoot -File -Force -Recurse
    foreach ($file in $fileList)
    {
        $fileName = $file.Name

        # Parse the 3 first characters of the invoice number
        $key = $file.BaseName.Substring(0,3)
        $keyfolder = $key

        $fileName = $file.Name
        $dstDir = Join-Path -Path $dstRoot -ChildPath $keyfolder

        if (-not (Test-Path -Path $dstDir))
        {
            mkdir -Path $dstDir
        }
        Write-Verbose "Moving $($file.FullName)"
        if (Test-Path -Path (Join-Path -Path $dstDir -ChildPath $fileName))
        {
            # Error message if file already exists at destination
            Write-Error -Message "File $fileName already exists at $dstDir" 
        } else {
            # OK to move file
            Move-Item -LiteralPath $($file.FullName) -Destination $dstDir
            
        }
    }

}