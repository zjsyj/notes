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
```

