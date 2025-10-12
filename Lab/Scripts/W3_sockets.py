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

Binding a service to 127.0.0.1 (default loopback) means it’s only accessible from that system, not
from the internet or other devices.
We will use a tool called netcat that is used as “nc” in Kali Linux that allows us to connect to
open ports or establish a listening connection on a listening port.

Lp is our listening port that’s all u need to understand for now. Anyone make connection in this
port we will listen.
Now lets create a socket script to connect to this port

After saving it run this file

And then in our listening port the log will be shown something like this

A connection was made from your own machine (127.0.0.1) to the same machine.
So your computer connected to itself — that’s what the loopback address (127.0.0.1) does.
The port 57756 is the temporary port the client side used to connect.
The connection is between 127.0.0.1:57756 (client) → 127.0.0.1:7777 (server).
