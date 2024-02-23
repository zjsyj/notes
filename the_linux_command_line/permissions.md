### users, groups, and everyone else
A user owns files and directories and has control over their access

Users belong to a group consisting of one or more users

```shell
id
```

Users are assigned a number called **USER ID** when created
which is mapped to username

The user is assigned a **PRIMARY GROUP ID** and belong to additional
group

User accounts are defined in /etc/passwd

Group accounts are defind in /etc/group

These files are modified along with /etc/shadow

### Reading, Writing and Executing
check a new file access rights
```shell
> new.txt
ls -l new.txt
```

Permission Attribute
|Attribute | Files | Directories|
|----------|-------|------------|
|r| allow a file to open and read| allow a directory content to be listed if execute attribute alse set|
|w| allow a file to write or truncted, however this attribute does not allow files to be renamed or deleted, these belong to directory attribute | allow files within a directory to be created, deleted or renamed if execute attribute also set|
|x| allow a file to be treated as program and executed | allow directory to be entered, eg cd |

```shell
chmod u+x some.sh
chmod 600 foo.txt
chmod go=rw foo.txt
chmod u+x,go=rx foo.txt
```

**umask** command controls default permissions given to a file when it is created

It uses octal notation to express a mask bits to be removed from a file's mode attributes.
```shell
umask
> foo2.txt
ls -l foo2.txt
-rw-rw-r-- ....
```
because a new file's default permission is (011011011) & !(000000010)

special permissions
|name|description|
|----|-----------|
|setuid bit, 4000|when applied to a executable, it sets the effective user ID from that of the real user to that of the program's owner|
|setgid bit, 2000|changes the effective group ID from the real group ID to that of th file owner|
|sticky bit, 1000|it prevents users from deleting or renaming files unless the is the owner of the file or superuser|

**the setuid bit** is often given to a few programs owned by superuser. when an ordinary user run these programs, the program runs with privilege of superuser

**the setgid bit** is set on a directory, newly created file in this directory will be given the group ownership of this directory rather the group ownership of the file creator, usually used to create share directory

**sticky bit** is often used to control access to a shared directory, eg /tmp

### changing identities
there are 3 ways to achive this task
- log out and log in as another user
- use **su** command
- use **sudo** commnd

**su** is used to start a shell as another user, ```su [-[l]] [user]```

*-]* option is included, the resulting shell session is a login shell for 
the specified user

if the user is not specified, th superuser is assumed

**sudo** execute a command as another user

the administrator can configure sudo to allow an ordinary user to execute
commands as different user(usually the superuser) in a control way

**sudo** does not require access to the superuser's password

```sudo -l```

```shell
# change owner and group of a file
sudo chown bob:users some_file # change the ownership of th file user bob, group of users
```

```shell
# change user password
passwd [user]
```
