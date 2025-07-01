$computers = get-content C:\Scripts\PClist.txt

foreach ($entry in $computers) {
	
Invoke-Command -ComputerName $entry -ScriptBlock {Get-WmiObject -Class Win32_logicalDisk -Filter "DeviceID='C:'" | Select SystemName, DeviceID, @{n='Size(GB)';e={$_.size / 1gb -as [int]}}, @{n='Free(GB)';e={$_.Freespace / 1gb -as [int]}}} > C:\Scripts\DiskInfo_output.txt
}