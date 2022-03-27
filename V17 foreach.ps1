# help topic
Get-Help about_Foreach

# syntax
foreach ($item in $collection) {
    # do something
}

# get all AD users (foreach loop)
$users = Get-ADUser -Filter *
foreach ($user in $users) {
    Write-Host $user.SamAccountName
}

# get all AD users (forech pipeline)
Get-ADUser -Filter * | ForEach-Object { Write-Host $_.SamAccountName } 

# help topic
Get-Help about_For

# syntax
for ($i = 0; $i -lt $array.Count; $i++) {
    # do something
}

# create a directory for every month of a year
$path = '\\DC1\Stuff\Reports\Monthly'
$year = (Get-Date).Year

for ($i = 1; $i -lt 13; $i++) {
    
    $month = Get-Date -Year $year -Month $i -Format "MM"

    $dir = "{0}\{1}\{2}-{1}" -f (
        $path,
        $year,
        $month
    )
    
    New-Item -Path $dir -ItemType Directory
} 


# help topic
Get-Help about_While

# syntax
while (condition) {
    # do something
}

# create a directory for every day of a year
$path = '\\DC1\Stuff\Reports\Daily'
$year = (Get-Date).Year 
$date = Get-Date -Year $year -Month 1 -Day 1

while ($date.Year -eq $year) {
    
    $dir = '{0}\{1}\{2}-{1}\{2}-{3}-{1}' -f (
        $path,
        $date.ToString('yyyy'),
        $date.ToString('MM'),
        $date.Tostring('dd')
    )
    
    New-Item -Path $dir -Type Directory

    $date = $date.AddDays(1)
} 


# help topic
Get-Help about_Do

# syntax
do {
    
} while (condition)

do {
    
} until (condition)


$machine = "DC2"

# loop while a condition is true
do {
    Write-Host "$machine is online!" -ForegroundColor Green
    Start-Sleep -Seconds 3
} while (Test-Connection $machine -Quiet -Count 1)

Write-Host "$machine is offline..." -ForegroundColor Red

# loop until a condition is true
do {
    Write-Host "$machine is offline..." -ForegroundColor Red
    Start-Sleep -Seconds 3
} until (Test-Connection $machine -Quiet -Count 1)

Write-Host "$machine is online!" -ForegroundColor Green