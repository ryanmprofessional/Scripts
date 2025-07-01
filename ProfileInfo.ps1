$path = "C:\Users\*"
$AddDays = Read-Host "How long user will be active (: in Days) "
$currDate = Get-Date
$newDate = (Get-Date).AddDays(-$AddDays)
$names = Get-Item -Path $path -include "$Include" |
 where {$_.LastWriteTime -le $newDate} | Select name
$names = $names | foreach {"/ed:" + $_.Name}
.\delprof2 /l $names -join ' '