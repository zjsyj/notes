## standard input, output, error
I/O redirection allow users to change where output goes, input comes from

```shell
ls -l /usr/bin > ls-output.txt
# truncate a file
> ls-output.txt

# append standard output to a file instead of overwriting the file from beginning
ls -l /usr/bin >> ls-output.txt
```

redirecting standard error, we must refer its **file descriptor**
```shell
ls -l /not_existed_path 2> error.txt
```

to redirect all output to a single file
```
ls -l /not_existed_path > ls-output.txt 2>&1
```

disposing of unwanted output
```
ls -l /not_existed_path 2> /dev/null

# just to introduce cat's special use case
cat movie.mepg.* > movie.mpeg
```
CTRL_d tell end of file

redirecting standard input
```
cat < some_file_name.txt
```

pipeline, the standard output of some program can be piped into the standard input of another
```shell
ls -l /usr/bin | less
```

### filters
```shell
ls /bin /usr/bin | sort | less
```


sort accept some parameters
```shell
# -n mean use number comparison
some_cmd some | sort -n | less

# -r mean reverse the order
some_cmd some | sort -n -r | less

# use different key
some_cmd some | sort --key=3n | less # or
some_cmd some | sort -k 3n | less

# field sperator
some_cmd some | sort -t: | less
```

uniq accepts a sorted list, removes any duplicat items from the lists
```
ls /bin /usr/bin | sort | uniq | less

# display repeatd number
ls /bin /usr/bin | sort | uniq -c | less
```

grep prints lines matching a pattern
```shell
# grep pattern [file ...]

# -i causes grep to ignore case
grep -i some_pattern file

# -v tells grep to print only those lines don't match
grep -v some_pattern file
```

tee read from Stdin and output to Stdout and files
```shell
ls /usr/bin | tee ls.txt | grep zip
```
