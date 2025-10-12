┌──(shiza㉿kali)-[~]
└─$ nc -nvlp 7777     

#!bin/bash/python3
#sockets
import socket
#sockets are used to make a connection between ports and ip add
HOST = '127.0.0.1'
PORT= 7777
#stream used for establishing the connection
s=socket.socket(socket.AF_INET, socket.SOCK_STREAM)
#af_net is ipv4,strem is port
s.connect((HOST,PORT))

listening on [any] 7777 ...
connect to [127.0.0.1] from (UNKNOWN) [127.0.0.1] 46552
