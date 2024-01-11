$pwshCSL = $ExecutionContext.SessionState.LanguageMode
$ISMAprovider = Get-ChildItem -Path 'HKLM:\SOFTWARE\Classes\CLSID\{2781761E-28E0-4109-99FE-B9D127C57AFE}'
$applockPol = Get-AppLockerPolicy -Effective
$allProcs = Get-Process
$boxInfo = Get-ComputerInfo
$WinDStat = Get-MpComputerStatus
$logMallProviders = logman query providers
$logMISMAProvider = logman query providers Microsoft-Antimalware-Scan-Interface
Write-Output "================================================================================" > C:\programdata\info.txt
Write-Output "The Happy, Safe and Friendly PowerShell Checking your PowerShell Secruity Script" >> C:\programdata\info.txt
Write-Output "================================================================================" >> C:\programdata\info.txt
Write-Output $pwshCSL >> C:\programdata\info.txt
Write-Output $ISMAprovider >> C:\programdata\info.txt
Write-Output $applockPol >> C:\programdata\info.txt
Write-Output $allProcs >> C:\programdata\info.txt
Write-Output $boxInfo >> C:\programdata\info.txt
Write-Output $WinDStat >> C:\programdata\info.txt
Write-Output $logMallProviders >> C:\programdata\info.txt
Write-Output $logMISMAProvider >> C:\programdata\info.txt
copy "C:\programdata\info.txt" "\\10.11.3.193\Share\"
