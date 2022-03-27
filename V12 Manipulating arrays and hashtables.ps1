# Manipulating arrays and hashtables

# You can create an array by providing multiple values in a comma-separated list. For example:
$computers = “DC1”,”DC2”,”Client1”
$numbers = 228,43,102

# You also can create an array by using the output from a command. For example:
$users = Get-ADUser -Filter *
$files = Get-ChildItem C:\
# You can create an empty array before you are ready to put content in it. This can be useful when you have a loop later on in a script that adds items to the array. For example:

$newUsers = @()
# You also can force an array to be created when adding a single value to a variable. This creates an arraywith a single value into which you can add items later. For example:
[array]$computers=”DC1”

# Working with arrays
# following example displays the first item in an array:
$users[0]
# You also can add a new item to an array. The following example adds the user account stored in $user1 tothe $users array:
$users = $users + $user1
# Often you will see this syntax shortened as the following example shows:
$users += $user1
# To identify what you can do with the content in an array, use the Get-Member cmdlet. 
# For example:
$files | Get-Member
# To create an arraylist when assigning values, use the following syntax:
[System.Collections.ArrayList]$computers = ”DC1”,”DC2”,”Client1”
# To create an arraylist that is empty and ready to add items, use the following syntax:
$computers=New-Object System.Collections.ArrayList
# When you use an arraylist, you can use methods to both add and remove items. However, these methods will fail when you try to use them on a fixed-size array. For example:
$computers.Add(“DC3”)
$computers.Remove(“Client1”)
# If you want to remove an item from an arraylist based on the index number, you use the RemoveAt() method. For example:
$computers.RemoveAt(1)

# Manipulating arrays and arraylists
# To set $users to be an array of user objects, type the following command, and then press Enter:
$users = Get-ADUser -Filter *
$users
# To view the number of items in $users, type the following command, and then press Enter:
$users.count
# To view the user object at index 2 of $users, type the following command, and then press Enter:
$users[2]
# To view the properties and methods available for the items in $computers, type the following command, and then press Enter:
$computers | Get-Member
# To view the properties and methods available for the items in $users, type the following command, and then press Enter:
$users | Get-Member
# To view the UserPrincipalName property for a user object in the array, type the following command, and then press Enter:
$users[2].UserPrincipalName

# To create an arraylist containing user objects, type the following command, and then press Enter:
[System.Collections.ArrayList]$usersList = Get-ADUser -Filter *
# To identify whether $usersList has a fixed size, type the following command, and then press Enter:
$usersList.IsFixedSize
# To view the number of items in $arrayList, type the following command, and then press Enter:
$usersList.count

#Hash tables
@{'key'='value';'associate this'='with that';'word'='definition'}
$ht = @{'key'='value';'associate this'='with that';'word'='definition'}
$ht.key
$ht.word

$servers = @{"DC1" = "172.16.0.10"; "DC2" = "172.16.0.11"}
# Adding or removing items from a hash table is similar to an arraylist. You use the methods Add() and Remove(). For example:
$servers.Add("SRV2","172.16.0.12")
$servers.Remove("DC1")
# You can also update the value for a key. For example:
$servers."SRV2"="172.16.0.100"
# To view all properties and methods available for a hash table, use the Get-Member cmdlet. For example:
$servers | Get-Member