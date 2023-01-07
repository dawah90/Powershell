<#
--------------
HKEY Explained
--------------

The HKEY_CLASSES_ROOT hive in the Windows registry contains information about file associations and COM object classes. 
It's used to associate file types with specific programs and to register COM objects.
Get-ChildItem -Path "HKCR:\"

The HKEY_CURRENT_USER hive in the Windows registry contains configuration settings that are specific to the currently logged-in user. 
It's used to store settings such as the desktop background, window layout, and other personal preferences.
Get-ChildItem -Path "HKCU:\"

The HKEY_LOCAL_MACHINE hive in the Windows registry contains configuration settings that apply to the local computer. 
It's used to store system-wide settings such as the device drivers, installed software, and hardware configurations.
Get-ChildItem -Path "HKLM:\"

The HKEY_USERS hive in the Windows registry contains configuration settings that apply to all user profiles on the local computer. 
It's used to store settings such as the desktop background, window layout, and other personal preferences for each user.
Get-ChildItem -Path "HKU:\"

The HKEY_CURRENT_CONFIG hive in the Windows registry contains configuration settings that apply to the current hardware profile of the local computer. 
It's used to store settings such as the device drivers and hardware configurations that are currently in use.
Get-ChildItem -Path "HKCC:\"


------------------------
Property types Explained
------------------------

String: This data type represents a sequence of Unicode characters. It can be used to store any text data.
ExpandString: This data type is similar to a string, but it allows environment variables to be embedded in the value data. These variables will be expanded when the value is read.
DWord: This data type represents a 32-bit unsigned integer. It can be used to store numerical data.
QWord: This data type represents a 64-bit unsigned integer. It can be used to store larger numerical data.
Binary: This data type represents a sequence of bytes. It can be used to store raw data such as executable files or images.


------------------------------------------------------
Add a key with properties as an array using a for loop.
------------------------------------------------------
#>

# Specify registry key path
$RegKey = "HKLM:\SOFTWARE\MyKey"
# PropertyName, PropertyValue, PropertyType
$KeyProperties = @(
    ("MyString","Hello, World!", "String"),
    ("MyExpandString","Hello,World!", "ExpandString"),
    ("MyDWord","1337","DWord"),
    ("MyQWord","1337","Qword"),
    ("MyBinary",[Byte[]](0x01, 0x02, 0x03, 0x04, 0x05),"Binary")
)

# Create Registry Key if it doesn't exist
if (-not (Test-Path -Path $RegKey)) { New-Item -Path $RegKey -ItemType Key }
# Loop through Array. Create the property if missing or modify the property if already existing
ForEach ($Property in $KeyProperties) {
    if ($(Get-ItemProperty -Path $Regkey -Name $Property[0] -ErrorAction SilentlyContinue)) { 
        Set-ItemProperty -Path $RegKey -Name $Property[0] -Value $Property[1] } 
    else { 
        New-ItemProperty -Path $RegKey -Name $Property[0] -Value $Property[1] -PropertyType $Property[2] 
    }
}

<#-----
Removal
-------#>

#Remove specific property
Remove-ItemProperty -Path $RegKey -Name "MyString"

#Remove all properties using ForEach
ForEach ($Property in $KeyProperties) {
    if ($(Get-ItemProperty -Path $Regkey -Name $Property[0] -ErrorAction SilentlyContinue)) { 
        Remove-ItemProperty -Path $RegKey -Name $Property[0] 
    } 
}

#Remove key with underlying properties
Remove-Item -Path $RegKey -Recurse

<#----------------------
Add a specific property
-----------------------#>

# Specify registry key path
$RegKey = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search"
$RegKeyName = "PreventIndexingOutlook"
$Value = 1
$PropertyType = "DWORD"

# Create Registry Key if it doesn't exist
if (-not (Test-Path -Path $RegKey)) { New-Item -Path $RegKey -ItemType Key }

if ($(Get-ItemProperty -Path $Regkey -Name $RegKeyName -ErrorAction SilentlyContinue)) { 
    Set-ItemProperty -Path $RegKey -Name $RegKeyName -Value $Value } 
    else { 
        New-ItemProperty -Path $RegKey -Name $RegKeyName -Value $Value -PropertyType $PropertyType 
    }

<#------------------------
Remove a specific property
-------------------------#>

$RegKey = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search"
$RegKeyName = "PreventIndexingOutlook"
if ($(Get-ItemProperty -Path $Regkey -Name $RegKeyName -ErrorAction SilentlyContinue)) { 
    Remove-ItemProperty -Path $RegKey -Name $RegKeyName 
} 