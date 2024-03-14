## The Environment
the shell maintains a body of information during our shell session called environment

the shell stores two basic types of data in the environment
* environment variables
* shell variables

two ways to see what is stored in the environment
* **set** builtin in bash show both the shell and environment variables
* **printenv** program only print environment variables

some interesting variables
**DISPLAY** the name of the display if we are running graphical environment

**PS1** prompt string 1 defines contents of shell prompt

**USER** your username

**LANG** defines the character set and collation order of your language

**PATH** colon-separated list of path that are searched when enter a executable

### Environment Establishment
log on to the system, the bash program starts, reads a series of configuration files called startup files.

type of shell sessions:
* A login shell session 
* A non-login shell session

startup files for login shell
|File|Contents|
|----|--------|
|/etc/profile|global configuration script that applies to all users|
|~/.bash_profile|A user's personal startup file|
|~/.bash_login|if ~/.bash_profile is not found, try this one |
|~/.profile| if last two are not found, try this one |

startup files for non-login shell
|File|Contents|
|----|--------|
|/etc/bash.bashrc| global configuration script for all users|
|~/.bashrc|a user personal startup file|



