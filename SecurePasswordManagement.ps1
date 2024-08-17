#region Option 1 - Store login credentials inside an XML-file (Limited to same account on same computer).

# Step 1: Provide and store credentials.
Get-Credential $env:COMPUTERNAME\$env:USERNAME | Export-Clixml C:\temp\credentials.xml
Get-Content C:\temp\credentials.xml

# Step 2: Import stored login and view password in clear text.
$MyCredentials = Import-Clixml C:\temp\credentials.xml

#endregion

#region Option 2 - Store password only inside a separate file (Limited to same account on same computer).

# Step 1:  Provide and store password.
Read-Host "Password: " -AsSecureString | ConvertFrom-SecureString | Out-File "C:\temp\PasswordFile.txt"

# Step 2: Import encrypted password, convert into secure string and create a credentials object:
$User = "$env:computername\$env:username"
$SecureStringPassword = (Get-Content "C:\Temp\PasswordFile.txt" | ConvertTo-SecureString)
$MyCredentials = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $User, $SecureStringPassword

#endregion

#region Option 3 - Encrypt password using custom key and store it inside a separate file (Usable by multiple accounts on multiple computers).

# Prepare custom encryption key:
$keyfile = "C:\temp\aes_password_encryption.key"
$key = New-Object Byte[] 32
[Security.Cryptography.RNGCryptoServiceProvider]::Create().getbytes($key)
$key | Out-File $keyfile

# Step 1: Provide password and obfuscate it using custom key:
$keyfile = "C:\temp\aes_password_encryption.key"
$key = Get-Content $keyfile
Read-Host "Password: " -AsSecureString | ConvertFrom-SecureString -Key $key | Out-File C:\temp\KeyPassword.txt

# Step 2: Import encrypted password, decrypt it using custom key and create a credentials object:
$User = "$env:computername\$env:username"
$EncryptedPassword = Get-Content "C:\temp\KeyPassword.txt"
$key = Get-Content "C:\Temp\aes_password_encryption.key"
$SecureStringPassword = $EncryptedPassword | ConvertTo-SecureString -key $Key
$MyCredentials = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $User, $SecureStringPassword

#endregion

#region Miscellanous

$MyCredentials.GetNetworkCredential().Password #View password in plain text.

# Check if provided credentials are valid on local computer
$User = $MyCredentials.Username
$Pass = $MyCredentials.GetNetworkCredential().Password

Add-Type -assemblyname System.DirectoryServices.AccountManagement 
$DS = New-Object System.DirectoryServices.AccountManagement.PrincipalContext([System.DirectoryServices.AccountManagement.ContextType]::Machine)
$CredentialResults = $DS.ValidateCredentials($User, $pass)
$CredentialResults # True or False

#endregion
