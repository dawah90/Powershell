# 1. Install Module - Needed once
<#
Get-Module -Name Microsoft.Online.SharePoint.PowerShell -ListAvailable | Select Name,Version	
Install-Module Microsoft.Online.SharePoint.PowerShell
#>

# 2. Connect to SPOService - Now that we have to CMDLets. https://lagerstedtkrantz-admin.sharepoint.com is the URL för sharepoint admin
#Connect-SPOService -Credential $creds -Url https://lagerstedtkrantz-admin.sharepoint.com -ModernAuth $true -AuthenticationUrl https://login.microsoftonline.com/organizations

# 3. Get LKP_Kvalitet | Delete LKP_Kvalitet
#Get-SPOSite -Identity "https://lagerstedtkrantz.sharepoint.com/sites/LKP_Kvalitet" | Select-Object *
#Get-SPOSite -Identity "https://lagerstedtkrantz.sharepoint.com/sites/LKP_Kvalitet" | Remove-SPOSite -WhatIf

# 4. Get LKP_Marknad | Delete LKP_Marknad
#Get-SPOSite -Identity "https://lagerstedtkrantz.sharepoint.com/sites/LKP_Marknad" | Select-Object *
#Get-SPOSite -Identity "https://lagerstedtkrantz.sharepoint.com/sites/LKP_Marknad" | Remove-SPOSite -WhatIf

#Get soft deleted SPO Sites
#Get-SPODeletedSite
