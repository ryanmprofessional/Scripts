$computers = get-content C:\Users\rmahaffy\Documents\PCs.txt

foreach($entry in $computers){
$users = query user /Server:$entry
$entry + " " + $users + "`n" > $results
}

$results | Out-File C:\Users\rmahaffy\Documents\Users.txt