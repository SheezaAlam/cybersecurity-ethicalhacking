nmap -V
#check version
nmap -vv <target add>
#verbose for additional info
states
open= service is actively waiting for a connection
close= get the response but doesnt react like someone knocking on a door and doesnt gets in.
filtered = no action cant be detect like it open or close cuz it doesnt reach to that port
#exploring multiples target
nmap <ip add> <ip add> <ip add>

#scanning the whole network by cidr notations
nmap 192.123.56.1/24

#range of ip add
nmap 192.156.23.1-5

#target list of ip add
make a file nano ip.txt 
enlist the ip add seperated by spaces
cat ip.txt 
nmap -F -iL ip.txt

scan ipv6 
ip a
you see inet 6 <add>
nmap -6 <that add>
scan random target
nmap -IR <#no of targets>

reason of ports
nmap --reason <add>
Display open ports
nmap --open <add>



