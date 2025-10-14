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


