<# Cheat sheet in how to use time. Source: https://en.wikipedia.org/wiki/ISO_8601#Durations 

P is the duration designator (for period) placed at the start of the duration representation.
    Y is the year designator that follows the value for the number of calendar years.
    M is the month designator that follows the value for the number of calendar months.
    W is the week designator that follows the value for the number of weeks.
    D is the day designator that follows the value for the number of calendar days.
T is the time designator that precedes the period with time components of the representation.
    H is the hour designator that follows the value for the number of hours.
    M is the minute designator that follows the value for the number of minutes.
    S is the second designator that follows the value for the number of seconds.

For example, "P3Y6M4DT12H30M5S" represents a duration of "three years, six months, four days, twelve hours, thirty minutes, and five seconds". #>

# Name the scheduled task:
$TaskName = "RunPowershellScript"

# Define action:
$Action = New-ScheduledTaskAction -Execute "Powershell.exe" -Argument "-ExecutionPolicy Bypass C:\_LKadmin\Script.ps1"

# Define start time:
$trigger = New-ScheduledTaskTrigger -Daily -At 9am 

# Stop automatically if running for over 1 hour:
$settings = New-ScheduledTaskSettingsSet -AllowStartIfOnBatteries -ExecutionTimeLimit (New-TimeSpan -Hours 1)

# Combine action, trigger and settings into a full task and register it:
$Task = New-ScheduledTask -Action $Action -Trigger $Trigger -Settings $Settings 
$Task | Register-ScheduledTask -TaskName $TaskName 

# "Repetition.duration" and "Repetition.interval" are not available until first registration so that's why the step Get-ScheduledTask is added.
$Task = Get-ScheduledTask -TaskName $TaskName 
$Task.Triggers[0].Repetition.Duration = "PT7H" # Repeat for 7 hours after first run.
$Task.Triggers[0].Repetition.Interval = "PT3H" # Repeat for 3 hours after first run.
$Task | Set-ScheduledTask
