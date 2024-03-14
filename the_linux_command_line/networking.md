## networking

The *ping* command sends a special network packet called
an ICMP ECHO_REQUEST to a specified host

```shell
ping linuxcommand.org

# ping a specific number
ping c 5 linuxcommand.org

# also display a message if no response
ping -O linuxcommand.org
```

The *traceroute or tracepath* list all the **hops** network traffic takes
to get from the local system to a specified host
```shell
traceroute google.com
```

**ip** command

The *netstat* command is used to examine various network settings and statistics

```shell
# examine the interface of network in a system
netstat -ie

# display the kernel's network route table
netstat -r

# netstat replacement
ss -l

# list process using socket
ss -p

# summary
ss -s
```

The *wget* command is used to download files
```shell
wget http://linuxcommand.org/index.php

# Download all listed files within a directory and its sub-directories (does not download embedded page elements):
wget --mirror --no-parent https://example.com/somepath/

# batch downloading
wget -i filelist.txt

# write output to somefile
sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
```

The *curl* command is good at emulation of client
```shell
# output response
curl "https://google.com"

# redirect page into local file
curl "https://google.com" > google.html

# or
curl -o google.html "https://google.com"

#
curl -O "https://ftp.lug.ustc.cn/misc/logo-whiteback-circle.png"
```


