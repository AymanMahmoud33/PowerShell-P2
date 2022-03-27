Get-Help about_If

# if syntax

# the if statement
$path = ".\Reports"
if (Test-Path $path) {
    Write-Host 'The reports directory exists!' -ForegroundColor Green
}

# the if..else statement
if (Test-Path $path) {
    Write-Host 'The reports directory exists!' -ForegroundColor Green
}
else {
    Write-Host 'The Reports directory does not exist.' -ForegroundColor Red
}

# if..elseif..else statement
$service = Get-Service -Name Spooler

if ($service.Status -eq 'Running'){
    Write-Host 'The Print Spooler service is RUNNING.' -ForegroundColor Green
}
elseif ($service.Status -eq 'Stopped') {
    Write-Host 'The Print Spooler service is STOPPED.' -ForegroundColor Red
}
elseif ($service.Status -eq 'Paused') {
    Write-Host 'The Print Spooler service is PAUSED.' -ForegroundColor Yellow
}
else {
    Write-Host "The Print Spooler service is $($service.status.ToString().ToUpper())." -ForegroundColor Cyan
} 