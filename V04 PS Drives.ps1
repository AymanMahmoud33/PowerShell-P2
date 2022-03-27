Dir # is an alias 
# This how you can list the folders and files, it is like a database coming from a store
# This is a provider you can access through PowerShell

# What if you can navigate something like the registry?
cd hkcu:
dir
cd software
ls
# all this happens because we have PowerShell providers

# This command list the providers
Get-PSProvider

# This command lists the drives
Get-PSDrive

Get-Command -Noun PSDrive

# create a drive
New-PSDrive -Name System -PSProvider FileSystem -Root C:\Windows
# now enter the drive
cd System:
# this drive is accessible only through PowerShell

cd c:

Get-Command -Noun Item*

# Understand the Providers have capabilities, and you can run command with only the parameters that are accepted by the PSProvider
Get-PSProvider # chech the capabilities

# you can test this point like the following 
dir -Path C:\Windows -Recurse -Filter *.exe
# this one worked

dir -Path HKCU:\SOFTWARE -Recurse -Filter win*
# this one doesn't work

# you can view the help for a provider
Help Registry

Help about_providers

# now have a look at the item properties
Get-ItemProperty -Path c:\test.txt | selet *
# now you can change one item property 
Set-ItemProperty -Path c:\test.txt -Name IsReadOnly -Value $true
Get-ItemProperty -Path c:\test.txt | selet *

cd hkcu:
ls
cd software
ls
cd microsoft
ls
cd .\Windows
ls
cd .\CurrentVersion
ls
cd .\Explorer
ls
Get-ItemProperty -Path Advanced

Set-ItemProperty -Path Advanced -Name HideFileExt -Value 0 

