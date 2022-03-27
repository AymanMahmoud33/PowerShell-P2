# The Repository 
# Finding Documentation 
# WMI vs CIM

# Start with intro guided by MOC slides 
# Demo wmi explorer GUI tool
# exploring documentation online by class name 
# exploring CIM using PowerShell

Get-CimClass -Namespace root\cimv2
Get-CimClass -Namespace root\cimv2 | where {$_.CimClassName -like '*disk*'}
 
#Once you know that you do not have anything else running on ports 80 and 443 set the WSMan listeners to use the compatibility ports (80 for HTTP and 443 for HTTPS).
Set-Item WSMan:\localhost\Service\EnableCompatibilityHttpListener -Value $true
Set-Item WSMan:\localhost\Service\EnableCompatibilityHttpsListener -Value $true 
