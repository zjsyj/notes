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

