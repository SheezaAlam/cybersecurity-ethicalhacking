there are commonly used 1000 ports
-F trims to the comonly used port to 100
nmap -F target add
nmap -F 192.168.56.1  
specific port (-p)
nmap -p 80 192.168.52.130
mention the port1,2,3,etc with a - range
nmap nmap -p 80,139,190-1000 192.168.52.130
getting detail through services name
nmap -p msrpc,http,apex-mesh 192.168.52.130

PORT     STATE  SERVICE
80/tcp   closed http
135/tcp  closed msrpc
912/tcp  closed apex-mesh
8008/tcp closed http

scanning the whole tcp and ip ports through wild card "*"
nmap -p "*" target address

scanning top port with < number of ports > <target add>
nmap --top-ports 10 192.168.52.130

sequential ports discovery with detail
nmap -v -r <target add>
-r Don't randomize the order of ports when scanning.
