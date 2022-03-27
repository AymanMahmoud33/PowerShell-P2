# Advanced Operators

<#
Is and As
Contains and In
Replace, Split, and Join
Math + Assignment
Bitwise
Boolean
Redirection
Dot Sourcing
Range
Formatting
Arrays
#>

# is operator
$x = 'hello'
$x -is [string]
$x -is [int]

$x -as [int]
34.7677 -as [int]

$x ='555'
$x -is [string]
$x -as [int]
$y = $x -as [int]
$y -is [int]
$y -isnot [string]

# Contains operator

$x = 'Hello'
$x -like 'He*'
$x -contains 'he'
# False because this is not how it works
# it checks if an element exists in an array
$x = 1,2,3,4,5,'one','two','three'
$x -contains 'one'
$x -contains 5
7 -in $x 
1 -in $x

# Replace Operator

$x = 'Hello There'
$x -replace 'l','x'

# Split and join

$array = 1,2,3,4,5,6
$array +='one','two','three'
#this is the same as the following
$array = $array + 'one','two','three'

$array -join ','
$list = $array -join ','
# now to read, check how this is different from reading from array!
$list[0]
$list[1]
$list[18] # will get the letter O

$a = $list -split ','
$a[-1]

# Math operators
$x = 10
$x += 10
$x *= 10
$x
# with strings
$s = 'Hello'
$s += ' There'
$s = $s + ' Ayman'

# ++ adds 1, and -- subtracts 1
$x++ # the same as $x = $x + 1, also the same as $x +=1
$x
$x--
$x

<#
 -band and -bor 
 to understand this you need to convert the decimal number to binary because that is what it do behinde the scene 
 00000111 = 7 in decimal 
 00001010 = 10 in decimal 

7 -band 10 output is 2, because that is what binary anding, it must see both bits 1 in order to return 1
 00000010 = 2 (anding of 7 and 10 in binary)
7 -or 10 output is 15, it return 1 if one or both bits are 1
00001111 = 15
 #>
 7 -band 10
 7 -bor 10
 # -bxor will return 1, if only one bit of both side is 1
 # study more with help
Help about_operators

(5 -gt 1) -and (5 -lt 10)
(5 -gt 1) -and (5 -lt 1)
(5 -gt 1) -or (5 -lt 1)
(5 -gt 1) -or (5 -gt 10)
(5 -gt 1) -xor (5 -lt 10) # exclusive or means only one side is true, not both, not none.
(5 -gt 1) -xor (5 -lt 1) 

# not simply reverse the logic
-not (5 -gt 1) -xor (5 -lt 1) 
# shot version is !
! (5 -gt 1) -xor (5 -lt 1) 
Help about_Operators

# out to files
dir > dir.txt
dir | out-file dir.txt
dir | out-file dir.txt -append
dir >> dir.txt
del somefile.txt 2> error.txt

# Range operators
1..100 # create these 2 values and every value between them
1..100 | get-random 
1..10 | foreach {dir} # whatever between brackets will run 10 times

# format operators 
"{0} {1:n2} {2} {3:n3}" -f "Hello",4.343434,"There",4.43245
"{0} {1:n2} {3:n3} {2}" -f "Hello",4.343434,"There",4.43245# you can change the order and the output will follow

# dot sourcing
# Create a function
function test {

    write 'Hello'
}
test
# use .\TestScript
# then use . .\TestScript
# the benefit of dot sourcing is when you need to import a function to your script you add this line . .\TestScript

Chain Operators
# help topic
Get-Help about_Pipeline_Chain_Operators

# simple examples
Write-Output "Left" && Write-Output "Right" # if left true, execute right
Write-Output "Left" || Write-Output "Right" # if left false, execute right

# without pipeline chain operators
$path = ".\servers.txt"
If (-Not (Test-Path -Path $path)) { 
    New-Item -Path $path -ItemType File
    @('DC1','FS1','SQL1') | Out-File -Path $path
}
# with pipeline chain operator
Get-Item -Path $path || New-Item -Path $path -ItemType File

# all the operators!
Get-Item -Path $path || 
    New-Item -Path $path -ItemType File && 
        @('DC1  ','FS1','SQL1') | 
            Out-File -Path $path
