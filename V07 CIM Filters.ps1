##CIM - filter and query##

Get-CimInstance Win32_Service
Get-CimInstance Win32_Service | Where-Object {$_.Status -ne 'ok'}
# notice that you got all the object then you selected some of them, based on the condition after the pipeline.
# there is a better way of doing that:
# it is by using -Filter and -Query parameters, check the help for Get-CimInstance

# Here you have to learn the syntax for WQL and CQL queries
# https://docs.microsoft.com/en-us/windows/win32/wmisdk/wql-sql-for-wmi

Get-CimInstance Win32_Service -ComputerName DC1 -Filter "state <> 'running' and startmode = 'auto'"
# this displays the services that is not running and the startup mode is to run automatically 
# this is different from the previous command, here the remote computer's WMI service did the work and gave back the list of stopped services only, 
# Before, we got all the services and applied the condition from our side then had the required output

# Now WQL query
# it is mostly like SQL queries
# Select * from Win32_LogicalDisk, I will put it in a variable to use it
$Q = 'Select * from Win32_LogicalDisk where DriveType = 3'
Get-CimInstance -Query $Q
# it can be used as usual with remote computers
Get-CimInstance -Query $Q -ComputerName DC1

# Now we can get the same info using 2 different ways, using -Filter and -Query
# this one from before
Get-CimInstance Win32_Service -ComputerName DC1 -Filter "state <> 'running' and startmode = 'auto'"
Get-CimInstance -Query "SELECT * FROM Win32_Service WHERE State <> 'running' AND startmode = 'auto'" -ComputerName DC1
