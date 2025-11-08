
`ip -a`
shows the ip adress on eth0

`ping <ip_address>`
shows the connectivity over the network

that the packet is transmitted from source to destination

`ping <ip add> -c 1`
-c here count for every ipadd by incrementing 1

saving the output in a file by ">"

`ping 192.168.52.130 -c 1 > ip.txt`

to gain that particular info we use grep command

`cat ip.txt | grep "64 bytes" | cut -d " " -f 4 -d ":"`
searching for 64 bytes , -f taking the output as 4 and remove :

mousepad use to opem the file and writeup the commands in one go

in file :ipsweep.sh
```

---

# ipsweep.sh

```bash
#!/bin/bash
for ip in `seq 1 254` ; do
ping -c 1 $1.$ip | grep "64 bytes" | cut -d " " -f 4 | tr -d ":" & 
done

loop continues searching for ip address 1 to 254 times
and ping  icrementing by 1 in that particular ip adrress 

$ chmod +x ip.sweep.sh 
changing the permission acess
to access that file

running the file:
./ipsweep.sh <ipadd>
shows all the connected ipadd of class over the network
```

