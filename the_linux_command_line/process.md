## process
like files, processes also have owners and user IDs, effective user IDS

view processes, use ps
```shell
# basic usage
ps

# x(no dash) show all processes regardless of what terminal controlled by
ps x

# aux(no dash) show processes belongs to every user
ps aux

# BSD Style
# USER, User ID
# %CPU, cpu usage in percent
# %MEM, memory usage in percent
# VSZ, virtual memory size
# RSS, Resident set size, physical memory used by process in kb
# START, time when process started
```

|state|meaning|
|-----|-------|
|R | Running |
|S|Sleeping|
|D|Uninterruptible sleep. waiting for IO|
|T|Stopped|
|Z|Zombie|
|< | a high priority process|
|N | a low priority process|


view process dynamically, use top command

top display sysmtem process listed in order of process activity, by default every 3 seconds

top display consists of two parts: **system summary** and **table of processes sorted by CPU activity**

top accepts a number of keyborad commands. Two most interesting commands are **h** and **q**

top -i -d 10 -e g -E g

### controlling a process
CTRL_c politely ask a process to terminate (interupt)

```shell
# putting a process in the background
xlogo &

# job control
jobs

# return a process to foreground
jobs %1

# stopping(paused) a process, CTRL_z
```

### sending signals to a process
use **kill** command to send signals to a processes

*kill -TERM some_process*

### shutting down system
* sudo reboot
* sudo poweroff
* sudo halt
* sudo shutdown -h now


### other related command
* pstree -p 1564
* vmstat 5
* xload
* tload


