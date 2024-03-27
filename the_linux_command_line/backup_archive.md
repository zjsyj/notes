## compress files
compression algorithms fall into two general categories:
* Lossless compression preserves all the data contained in the original
* Lossy compression removes data to allow more compression to be applied

The *gzip* program is used to compress one or more files.

The *gunzip* program is used to restore compressed files.

```shell
ls -l /etc > foo.txt
ls -l foo.*
gzip foo.txt
ls -l foo.*
gunzip foo.txt
ls -l foo.*

# gzip acts like gunzip
gzip -d foo.txt

# gzip test
gzip -tv foo.txt.gz
```

The *bzip2* program is similar to *gzip* but use different compression algorithm that achieve high levels of compression at the cost of compression speed.

```shell
ls -l /etc > foo.txt
ls -l foo.txt
bzip2 foo.txt
ls -l foo.txt.bz2
bunzip2 foo.txt.bz2
```

## Archiving Files
*tar* program is used to archive files, which is short for tape archive

```
tar mode[options] pathname
```

|mode|description|
|----|-----------|
|c | create an archive from a list of files and/or directories|
|x | extract an archive |
|r | Append specified pathnames to the end of an archive |
|t | List the contents of an archive |

```shell
tar cf playground.tar tmp1/file1 file2
tar rf playground.tar tmp1/file3
tar tvf playground.tar
mkdir foo && cd foo
tar xvf ../playground.tar
```

## synchronizing files and directories
the prefered tool for this task is *rsync*

**rsync options source destination**

the source and description cound be one of following:
* a local file or directory
* a remote file or directory in the form of [user@]host:path
* a remote rsync server specified with a URI of rsync://[user@]host[:port]/path

```shell
rsync -av playground foo

# delete files that no longer existed on the source directory
rsync -av --delete source destination
```

