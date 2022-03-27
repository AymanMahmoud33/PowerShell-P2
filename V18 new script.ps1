# initialize empty array (stores custom objects)
$allstats = @()

# get all computer names from Active Directory
$machines = Get-ADComputer -Filter * | Select-Object -ExpandProperty Name

# loop through each machine
foreach ($machine in $machines)
    {

    # create a custom object
    $stats = @{
        MachineName = $machine
        MachineStatus = "Offline"
        MachineType = ""
        TotalMemoryGB = 0
        AvailableMemoryGB = 0
        OperatingSystem = ""
        SystemDrive = ""
    }

    # check if machine is online
    if (Test-Connection -ComputerName $machine -Count 1 -Quiet) {

        # gather server stats
        $os = Get-CimInstance -ClassName Win32_OperatingSystem -ComputerName $machine
        
        # load up custom object properties
        $stats.MachineStatus = "Online"
        $stats.TotalMemoryGB = [math]::round(($os.TotalVisibleMemorySize / 1MB), 2)
        $stats.AvailableMemoryGB = [math]::round(($os.FreePhysicalMemory / 1MB), 2)
        $stats.OperatingSystem = $os.Caption
        $stats.SystemDrive = $os.SystemDrive

        switch ($os.ProductType) {
            1 { $stats.MachineType = "Workstation" }
            2 { $stats.MachineType = "Domain Controller" }
            3 { $stats.MachineType = "Server" }
        }
    }

    # add custom object to array
    $allstats += $stats
}

# output custom object array!
$allstats | 
    Select-Object @{n='MachineName';e={$_.MachineName}}, 
                  @{n='MachineStatus';e={$_.MachineStatus}}, 
                  @{n='MachineType';e={$_.MachineType}}, 
                  @{n='TotalMemoryGB';e={$_.TotalMemoryGB}}, 
                  @{n='AvailableMemoryGB';e={$_.AvailableMemoryGB}}, 
                  @{n='UsedMemoryGB';e={$_.TotalMemoryGB - $_.AvailableMemoryGB}},
                  @{n='OperatingSystem';e={$_.OperatingSystem}},
                  @{n='SystemDrive';e={$_.SystemDrive}} |
        Sort-Object MachineName |
            Format-Table -AutoSize 
