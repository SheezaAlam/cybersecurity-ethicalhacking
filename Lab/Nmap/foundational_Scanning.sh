nmap -Pn target add
-pn here means that it doesnt check the host is up or not
bypass firewalls

only checks which hosts are up without scanning for open ports
only checks for connected devices
nmap -sP target add

nmap -PS target add
here -PS ping for tcpsync
sync- req for a connection
syncack- ack- lets connect (port is open)
ack- connection is established

tcp ack
if the connection is lost it will react as reset
if there no reply that means this is filtered
nmap -PA target add

-PU tells Nmap to send UDP packets as a probe to see if a host is up.
probe means test messages

──(shiza㉿kali)-[~]
└─$ nmap -PY target add
-py used for host discovery for sctp (stream control transmission protocol)
used in telecom signals rearely used
ot work like tcp sync also it start its connection by init 
if no ports provided it will target port 80

nmap -PE 10.0.2.2
-PE uses icmp
icmp is internet control message protocol
which is used to identify errors do network configuration and diagnosis
like the packet is traceout the host is up or down usually do for scanning ping the address echo the message
it has some privilages and cant bypass the firewall

nmap -PP target address
timestamp

nmap -PR target add
-PR used for arp which cannot be block by firewall
find host on the same lAN
works only if you and target is on same ethernet

-PO tells Nmap to send packets with particular IP protocol numbers (the IP “protocol” field), to detect hosts that respond to certain protocols.

Example protocols: ICMP (1), IGMP (2), TCP (6), UDP (17), etc. You supply protocol numbers or names.

-n	Disable all DNS resolution (faster, IPs only)
-R	Force reverse DNS lookups (PTR records)
--dns-servers	Use specific DNS servers
--system-dns	Use the system resolver (instead of Nmap's own DNS engine)


