[System.Globalization.NumberFormatInfo]::CurrentInfo.NumberDecimalSeparator

#[System.Globalization.CultureInfo]::GetCultureInfo("culture code").NumberFormat.NumberDecimalSeparator

[System.Globalization.CultureInfo]::GetCultureInfo("en-US").NumberFormat.NumberDecimalSeparator

Pause

[System.Threading.Thread]::CurrentThread.CurrentCulture = [System.Globalization.CultureInfo]::GetCultureInfo("sv-SE")

[System.Globalization.NumberFormatInfo]::CurrentInfo.NumberDecimalSeparator

#[System.Globalization.CultureInfo]::GetCultureInfo("culture code").NumberFormat.NumberDecimalSeparator

[System.Globalization.CultureInfo]::GetCultureInfo("en-US").NumberFormat.NumberDecimalSeparator

Pause