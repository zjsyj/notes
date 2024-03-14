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
find ~ -type f -name "*.JPG" -size +1M | wc -l


