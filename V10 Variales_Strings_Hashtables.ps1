#Variables, string and hash tables
<# 
Variables
Quotes
Double quote tricks
Subexpressions
Here Strings
Escape Characters
Variable types
Arrays
Math Operators
#>

$var = 'hello'
dir variable:
# $ is not part of the variable name
# var is the variable itself (the container or the box that holds the value)
# $var is the value within the variable 

# now think about what this command produces 
New-Variable -name $var -Value 'Ayman'
# using the $ I dereferenced, I referred to what is inside the variable var
# meaning that I created a variable with the name 'hello' and the value 'Ayman'

$Var1 = 5

${Var2} = 8

dir variable:

# The difference between " " and ' ' 
$var = 'Hello'
$a = "Say $var"
$b = 'Say $var'

$a = "say $var there"
$a
$a = "say $var there `$var"
$a
$a = "say $var there `$var`n`n`nhey"
$a

$b = '`n`n`n`nhello $var'
$b # ' ' take every thing as letteral as it is.

# Subexpressions

$s = Get-Service
$s[0]
$s[1].Name

$ServiceList
$ServiceList = "$($s[0].Name)" # subexpression executes what within () as a separate code
$ServiceList
$ServiceList = $s[0].Name # the same as it execute what is after =
$ServiceList

$a = "This is 
a string 
containing 
$var
"
$Message = @"
$var
This is 
a string
"@
$Message

########

$a = 5
$b = '5'
$a + $b
$b + $a 

$repeat = Read-Host "How many times to repeat the operation"
# enter a string instead of a number, enter 'Red' for example 
$repeat
[int]$repeat = Read-Host "How many times to repeat the operation"
# now enter a number as required  
$repeat
# there is more like this to declare variables
[string]$color = 'Red'
[float]$f = 5.44
[bool]$x = $true

$s = Get-Service
$var = "$s"
$var
# what this does was previously done like the following
$var = "$($s.Name)