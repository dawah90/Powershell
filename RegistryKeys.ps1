<# - HKEY Explained
--------------------

The HKEY_CLASSES_ROOT hive in the Windows registry contains information about file associations and COM object classes. It's used to associate file types with specific programs and to register COM objects.
Get-ChildItem -Path "HKCR:\"

The HKEY_CURRENT_USER hive in the Windows registry contains configuration settings that are specific to the currently logged-in user. It's used to store settings such as the desktop background, window layout, and other personal preferences.
Get-ChildItem -Path "HKCU:\"

The HKEY_LOCAL_MACHINE hive in the Windows registry contains configuration settings that apply to the local computer. It's used to store system-wide settings such as the device drivers, installed software, and hardware configurations.
Get-ChildItem -Path "HKLM:\"

The HKEY_USERS hive in the Windows registry contains configuration settings that apply to all user profiles on the local computer. It's used to store settings such as the desktop background, window layout, and other personal preferences for each user.
Get-ChildItem -Path "HKU:\"

The HKEY_CURRENT_CONFIG hive in the Windows registry contains configuration settings that apply to the current hardware profile of the local computer. It's used to store settings such as the device drivers and hardware configurations that are currently in use.
Get-ChildItem -Path "HKCC:\"
#>


<# - Property types Explained
------------------------------

String: This data type represents a sequence of Unicode characters. It can be used to store any text data.
ExpandString: This data type is similar to a string, but it allows environment variables to be embedded in the value data. These variables will be expanded when the value is read.
DWord: This data type represents a 32-bit unsigned integer. It can be used to store numerical data.
QWord: This data type represents a 64-bit unsigned integer. It can be used to store larger numerical data.
Binary: This data type represents a sequence of bytes. It can be used to store raw data such as executable files or images.
#>

<# Version 1

#Create Key if it doesn't already exist
$RegKey = "HKLM:\SOFTWARE\MyKey"
if (-not (Test-Path -Path $RegKey)) { New-Item -Path $RegKey -ItemType Key }

#Create ("PropertyName", "PropertyValue", "PropertyType")
$StringProperty = ("MyString","Hello, World!", "String")
$ExpandStringProperty = ("MyExpandString","Hello,World!", "ExpandString")
$DWordProperty = ("MyDWord","1337","DWord")
$QWordProperty = ("MyQWord","1337","Qword")
$BinaryProperty = ("MyBinary",[Byte[]](0x01, 0x02, 0x03, 0x04, 0x05),"Binary")

#Create property with the value and property type if it doesn't exist. Just add the value if the property already exists.
if ($(Get-ItemProperty -Path $Regkey -Name $StringProperty[0] -ErrorAction SilentlyContinue)){ Set-ItemProperty -Path $RegKey -Name $StringProperty[0] -Value $StringProperty[1] } else { New-ItemProperty -Path $RegKey -Name $StringProperty[0] -Value $StringProperty[1] -PropertyType $StringProperty[2] }
if ($(Get-ItemProperty -Path $Regkey -Name $ExpandStringProperty[0] -ErrorAction SilentlyContinue)){ Set-ItemProperty -Path $RegKey -Name $ExpandStringProperty[0] -Value $ExpandStringProperty[1] } else { New-ItemProperty -Path $RegKey -Name $ExpandStringProperty[0] -Value $ExpandStringProperty[1] -PropertyType $ExpandStringProperty[2] }
if ($(Get-ItemProperty -Path $Regkey -Name $DWordProperty[0] -ErrorAction SilentlyContinue)){ Set-ItemProperty -Path $RegKey -Name $DWordProperty[0] -Value $DWordProperty[1] } else { New-ItemProperty -Path $RegKey -Name $DWordProperty[0] -Value $DWordProperty[1] -PropertyType $DWordProperty[2] }
if ($(Get-ItemProperty -Path $Regkey -Name $QWordProperty[0] -ErrorAction SilentlyContinue)){ Set-ItemProperty -Path $RegKey -Name $QWordProperty[0] -Value $QWordProperty[1] } else { New-ItemProperty -Path $RegKey -Name $QWordProperty[0] -Value $QWordProperty[1] -PropertyType $QWordProperty[2] }
if ($(Get-ItemProperty -Path $Regkey -Name $BinaryProperty[0] -ErrorAction SilentlyContinue)){ Set-ItemProperty -Path $RegKey -Name $BinaryProperty[0] -Value $BinaryProperty[1] } else { New-ItemProperty -Path $RegKey -Name $BinaryProperty[0] -Value $BinaryProperty[1] -PropertyType $BinaryProperty[2] }

#>

<# Version 2 - Add a key with properties as an array using a for loop#>

$RegKey = "HKLM:\SOFTWARE\MyKey"

# PropertyName, PropertyValue, PropertyType
$KeyProperties = @(
    ("MyString","Hello, World!", "String"),
    ("MyExpandString","Hello,World!", "ExpandString"),
    ("MyDWord","1337","DWord"),
    ("MyQWord","1337","Qword"),
    ("MyBinary",[Byte[]](0x01, 0x02, 0x03, 0x04, 0x05),"Binary")
)

# Loop through Array
ForEach ($Property in $KeyProperties) {
    if ($(Get-ItemProperty -Path $Regkey -Name $Property[0] -ErrorAction SilentlyContinue)){ Set-ItemProperty -Path $RegKey -Name $Property[0] -Value $Property[1] } else { New-ItemProperty -Path $RegKey -Name $Property[0] -Value $Property[1] -PropertyType $Property[2] }
}

#########################################################################

# Remove Key
Remove-Item -Path $RegKey -Recurse