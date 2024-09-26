```shell
# increment number or decrease number in vim
# in normal mode, type as following
# suppose you type this line: 101 This is an item.
# qa
# Y
# p
# Ctrl-A
# q
# 15@a
# you will see
# 101 This is an item.
# 102 This is an item.
# 103 This is an item.
# and so on
```

```shell
cat > foo.txt

# -A to print out non-printable characters
cat -A foo.txt

# -n number the line, -s suppress multiple empty lines
cat -ns foo.txt
```

*sort* sorts the content of standard input or specified files,
and send the results to the standard output
```shell
sort > foo.txt

# -b ignore leading spaces
sort -b file1.txt file2.txt

# -n performs sorting based on numberical value instead of alphabetic value
sort -n file1.txt file2.txt

# -r reverse the sorting results
sort -r file1.txt

# -k sort based on a key field
sort -k 3 file1.txt

# -t separator
sort -t ',' file1.txt

# examples
du -s /usr/share/* | sort -nr | head

sort -k 3.7nbr -k 3.1nbr -k 3.4nbr distros.txt
```

*uniq* removes duplicated lines from sorted files, send results to standard output


The next 3 tools are used to peel columns from files and recombine them in useful ways

```shell
# -c is used to tell cut character list, -f tell cut field list
cut -f 3 distros.txt | cut -c 7-10

# -d specify separator
cut -d ':' -f 1 /etc/passwd
```

*paste* adds one or more columns of text to a file

*join* joins data from mulitple files based on a shared key field

*diff -u file1.txt file2.txt*


there some tools used to edit file on the fly

```shell
echo "lowercase letters" | tr a-z A-Z

echo "lowercase letters" | tr [:lower:] [:uppercase:]

tr -d '\r' <dos_file> unix_file
```

*sed* performs text editing on a stream of text
```shell
echo "front" | sed 's/front/back/'

# separtor could change
echo "front" | sed 's_front_back_'

# could use address
echo "front" | sed'1s/front/back/'

# -n (no auto-print) 
sed -n '/SUSE/p' distros.txt
sed -n '1,5p' distros.txt

# -f use file as command input
sed -f some.sed some.txt
```

sed Address notation
|address|description|
|-------|-----------|
|n|a line number|
|$|the last line|
|/regexp/|lines matching a POSIX basic regular expression|
|addr1,addr2|a range of lines from 1 to 2, inclusive|
|first~step|1~2 refers to each odd numbered line|
|addr1, +n|matching addr1 and the following n line|
|addr!|matching all lines except addr|
