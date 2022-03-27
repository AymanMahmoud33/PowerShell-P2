## CIM to query data##

# Getting classes
# Getting instances 
# Working with command options
# Working with output
# It is all remote
Get-Command -Noun cim*
# you start navigating at the namespace level, inside you have classes, you have classes for instance you could have.
# then you have instance for the object you actually have.
# lets start by having a look at CimClass command
Help Get-CimClass

# as a start
Get-CimClass -ClassName Win32_BIOS -Namespace root/CIMV2
Get-CimClass -ClassName Win32_BIOS -Namespace root/CIMV2 | fl -Property *
# you can see a collection of objects in "CimClassProperties", use -ExpandProperty to see them
Get-CimClass -ClassName Win32_BIOS -Namespace root/CIMV2 | select -ExpandProperty CimClassProperties

# Now lets get an instance properties 
Get-CimInstance Win32_BIOS -Property * # this list all the properties 
Get-CimClass -ClassName Win32_BIOS -PropertyName serialnumber # that retreive back the entire object but only fill the property you set

# getting information about remote computers
Get-CimInstance -ClassName Win32_OperatingSystem -ComputerName DC1
Get-CimInstance -ClassName Win32_OperatingSystem -ComputerName DC1 | select *
