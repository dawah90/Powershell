[System.Globalization.NumberFormatInfo]::CurrentInfo.NumberDecimalSeparator
[System.Globalization.CultureInfo]::GetCultureInfo("en-US").NumberFormat.NumberDecimalSeparator

Pause

#Set Culture Info to swedish format. Makes sure decimal delimiter is shown as , and not .
[System.Threading.Thread]::CurrentThread.CurrentCulture = [System.Globalization.CultureInfo]::GetCultureInfo("sv-SE")
[System.Globalization.NumberFormatInfo]::CurrentInfo.NumberDecimalSeparator
[System.Globalization.CultureInfo]::GetCultureInfo("en-US").NumberFormat.NumberDecimalSeparator

Pause