## CIM Sessions ##

# Managing CIM sessions
# WS-Man and DCOM sessions
# Using session types in combination 

# first we try to connect at get information from DC1 using WMI
Get-WmiObject -ComputerName DC1 -Class Win32_bios
# it may fail because RPC server is unavailable 

# now we try CIM
Get-CimInstance -ComputerName DC1 DC.lab.local -ClassName Win32_bios
# it replies almost instantely (WS-Man is enabled by default in windows server 2012 and later)

# CIM session is used to establish a persistent connection to a computer(s) to deal with the CIM repository
# first check if WS-Man is working on remote computer
Get-CimInstance -ComputerName DC1 -ClassName Win32_bios 

# now we will talk about how to establish CIM session with DC1

# what are the commands?
Get-command -Noun cim*

# now I will establish a session with DC1 and save it in a variable 
$DC1 = New-CimSession -ComputerName DC1.lab.local
# view session info
Get-CimSession
# new session wtih DC2
$DC2 = New-CimSession -ComputerName DC2.lab.local

# now we have two session opened with DC1 and DC2
Get-CimSession | ft

# Get-CimInstance from those sessions
Get-CimInstance -ClassName Win32_OperatingSystem -CimSession $DC1,$DC2 | select PSComputerName,Version,BuildNumber | ft
# The advantage here is we already have session opened, and with one command we get information for all computers that have sessions opened 

Get-CimInstance -ClassName Win32_ComputerSystem -CimSession $DC1,$DC2

# so if we need to open sessions for 50 computers, do we have to do it manualy for all
# sure, no
# let's clean up first
# Remove the sessions
Get-CimSession | Remove-CimSession
Remove-Variable $DC1,$DC2

$sessions = New-CimSession -ComputerName DC1.lab.local,DC2.lab.local
# and we can read computer names from a file, this is how we can open many sessions at one shoot
# now we use them
Get-CimInstance -ClassName Win32_ComputerSystem -CimSession $sessions

