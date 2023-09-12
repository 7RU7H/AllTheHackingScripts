# Port scan a box
1..1024 | %(echo ((New-Object Net.Sockets.TcpCLient).Connect("10.10.10.10", $_)) "Open port on - $_" 2>$null
