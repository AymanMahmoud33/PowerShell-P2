# Making changes by using CIM and WMI
# Finding methods documentation 
# Executing methods via CIM
# Enumerating to execute methods 
# Tips and tricks
# to learn about class methods
Get-CimInstance -ClassName Win32_Service | Get-Member
# members her won't give much information about the methods, so you have to search for the documentation 

# example on how to use the methods
$Service = Get-CimInstance -ClassName Win32_Service -Filter "name like 'appinfo'"
$Service.StopService()

# Finding methods using PowerShell
Get-CimClass -Class Win32_Service | Select-Object -ExpandProperty CimClassMethods
# this way is not the best, it is easier to search online for the documentation of the class

$os = Get-CimInstance Win32_OperatingSystem
# calling a property
$os.LastBootUpTime
# calling a method for "DateTime" object
$os.LastBootUpTime.ToShortDateString()
# see how the object changed using the method of ToShortDateString()
$os.LastBootUpTime | gm
$os.LastBootUpTime.ToShortDateString() | gm

# Using CimClass Methods with CimInstances
$dc1 = New-CimSession -ComputerName dc1 -Credential administrator


# discover the methods for the CLASS itself
Get-CimClass -Class Win32_OperatingSystem | Select-Object -ExpandProperty CimClassMethods

# now use the method with the CimInstance
Get-CimInstance -ClassName win32_operatingsystem -CimSession $dc1 | Invoke-CimMethod -Name Shutdown


# example of using invoke method with a service
$dc1 = New-CimSession -ComputerName dc1 -Credential administrator
$dc2 = New-CimSession -ComputerName dc2 -Credential administrator
Get-CimInstance -CimSession $dc1,$dc2 -ClassName win32_service -Filter "name = 'bits'" | gm
Get-CimClass Win32_Service | select -ExpandProperty CimClassMethods
Get-CimInstance -CimSession $dc1,$dc2 -ClassName win32_service -Filter "name = 'bits'" | Invoke-CimMethod -Name StartService
