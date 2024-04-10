## Searching for files

The *locate* command finds file the easy way

*locate* performs a rapid database search of pathnames,
and then outputs every name that matches a given substring

```shell
locate bin/zip

# locate database is created by updatedb, usually a cron daemon
sudo updatedb
```

The *find* command find files the hard way
```shell
find ~ -type d | wc -l

# regular JPG files that are bigger than 1M
# use quotes to prevent pathname expansion in *.JPG
find ~ -type f -name "*.JPG" -size +1M | wc -l
```

|file type|description|
|---------|-----------|
|b|block special device file |
|c|character special device file|
|d|directory|
|f|regular file|
|l|symbolic link|


find tests
|test|description|
|----|-----------|
|-cmin n|match files or directories whose contents  were modified n minutes ago||-empty|match empty files|
|-group name|match file or directory belonging to group|
|-size n|match files of size n, - smaller than n, + larger than|
|-user name| match files or directories belonging to user **name**|

predefined actions
|action|description|
|------|-----------|
|-delete|delete the currently matching file|
|-ls|perform the equivalent of ls -dils on the matching file|
|-print| output the full pathname of matching files|
|-quit|quit once a match has been made|

```shell
find ~ -type f -name "*.bak" -print

find ~ ( -type f -not -perms 0600 ) -or ( -type d -not -perms 0700 ) -delete
```

In addtion to the predefined actions, we can also invoke user-defined actions

**-exec command {} ;**

```shell
find ~ -type f -name 'foo*' -ok ls -l '{}' ';'

# when the -exec action is used, it launches a new instance
# of the specified command each time a matching file is found

# instead of ls -l file1; ls -l file2, we may prefer ls -l file1 file2
find ~ -type f -name 'foo*' -exec ls -l '{}' +

# we could also use xargs
#
# xargs accepts input from standard input and convert it into argument list 
# for a specified command
find ~ -type f -name 'foo*' -print | xargs ls -l

# to prevent spaces or newline in filename, use NULL as end of line
find ~ -iname '*.jpg' -print0 | xargs --null ls -l
```

find options
|option|description|
|------|-----------|
|-depth|direct **find** to process a directory's files before the directory itself|
|-maxdepth levels|set maximum number of levels that **find** will descend|
|-mindepth levels|set minimum number of levels that **find** will descend|
|-mount|direct find not to traverse directories that are mounted on other file systems|

