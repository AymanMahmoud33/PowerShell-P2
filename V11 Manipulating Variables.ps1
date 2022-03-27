$logFile = "C:\Logs\log.txt"
$logFile.Contains("C:")
$logFile.Contains("D:")
$logFile.Insert(7,"\MyScript")
$logFile
$logFile=$logFile.Insert(7,"\MyScript")
$logFile
$logFile.Replace(".txt",".htm")
$logFile.Split("\")
$logFile.Split("\") | Select -Last 1
$logFile.ToUpper()
$logFile.ToLower()

Working with DateTime object
$date = Get-Date
$date
$date.Hour
$date.Minute
$date.Day
$date.DayOfWeek
$date.Month
$date.Year
$date.AddDays(100)
$date.AddDays(-60)
$date.ToLongDateString()
$date.ToShortDateString()
$date.ToLongTimeString()
$date.ToShortTimeString()
