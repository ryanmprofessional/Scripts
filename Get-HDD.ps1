$entry = Read-Host -Prompt "PC Name"
$disk = Get-WmiObject Win32_LogicalDisk -ComputerName $entry -Filter DriveType=3 | 
Select-Object DeviceID, 
@{'Name' = 'Size'; 'Expression' = { [math]::truncate($_.size / 1GB) } }, 
@{'Name' = 'Freespace'; 'Expression' = { [math]::truncate($_.freespace / 1GB) } }
$entry + ": " + $disk.DeviceID + " " + $disk.FreeSpace.ToString("N0") + " GB free of " + $disk.Size.ToString("N0") + " GB `n"
pause