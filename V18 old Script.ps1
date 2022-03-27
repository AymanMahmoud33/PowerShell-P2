# ask for server name, store it in a variable
$server = Read-Host -Prompt "Enter a server name (localhost is default)"

# if no server name was entered, set the variable to localhost
if ($server -eq "") {
    $server = "localhost"
}

# ternary operator (can replace above if statement)
# $server = ($server -eq "") ? "localhost" : $server

# gather server stats
$os = Get-CimInstance -ClassName Win32_OperatingSystem -ComputerName $server
$memTotal = [math]::round(($os.TotalVisibleMemorySize / 1MB), 2)
$memAvailable = [math]::round(($os.FreePhysicalMemory / 1MB), 2)

# write stats to hosts
Write-Host "Stats for $server" -ForegroundColor Green
Write-Host ("-" * 25)
Write-Host "Total Memory     : $memTotal GB"
Write-Host "Available Memory : $memAvailable GB"
Write-Host "Used Memory      : $($memTotal - $memAvailable) GB"
Write-Host "Operating System : $($os.Caption)"
Write-Host "Available Memory : $($os.SystemDrive)\" 