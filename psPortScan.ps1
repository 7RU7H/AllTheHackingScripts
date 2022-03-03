#Determine IP ranges to scan(in this case it will be localhost) and you can provide the input in any way you want
#Determine the port ranges to scan
#Determine the type of scan to run(in this case it will be a simple TCP Connect Scan)


$ip = 'localhost'
$portmin = 0
$portmax = 1024

for ($i=portmin; $i -le $portmax; $i++ {
	Test-NetConnection -ComputerName -$ip -Port $i -InformationLevel "Detailed"
	}
