# so how to search for a module, and how to install it
Find-Module *excel*
Find-Module importexcel
Find-Module importexcel | select description
Find-Module importexcel | select description | fl
# in the description you will find a video to learn about this module

Install-Module importexcel 

Get-module -ListAvailable

Get-InstalledModule PSWindowsUpdate
If(!(Get-InstalledModule PSWindowsUpdate)) 
    {
    Install-Module PSWindowsUpdate -force
    }
    Else 
    {
    Write-Host "PSWindowsUpdate is installed"
    }
        
    #Finally, we run 
    Get-WindwosUpdate
    
