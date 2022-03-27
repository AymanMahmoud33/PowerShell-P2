# help topic
Get-Help about_Switch

# syntax

# simple examples
$x = 1
switch ($x) {
    1 { "one" }
    2 { "two" }
    3 { "three" }
    1 { "one for the second time!" }
    Default { "default"}
}

$s = "data"
switch ($s) {
    "data"   { "data" }
    "string" { "string" }
    Default  { "default"}
}

# switch parameters
$hw = "Hello World!"
switch -Wildcard ($hw) {
    "hi*"   { "hi" }
    "hello*" { "hello" }
    "*world*" { "world" }
    Default  { "default"}
}

$file = ".\servers.txt"
switch -File ($file) {
    "DC1"    { Test-Connection -ComputerName $_ -Count 1 }
    "DC2"    { Test-Connection -ComputerName $_ -Count 1 }
    "Client1" { "nope" }
    Default { "default"}
}

# another example
$service = Get-Service -DisplayName *windows*
switch ($service) {
    { $_.Status -eq 'Stopped' -or $_.Status -eq 'Paused'} { Write-Host $_ -ForegroundColor Red}
    { $_.Status -eq 'Running' } { Write-Host $_ -ForegroundColor Green }
    Default { Write-Host $_.Status.ToString().ToUpper() -ForegroundColor Cyan }
} 