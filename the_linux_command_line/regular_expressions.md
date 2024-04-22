## regular expressions
**grep** global regular expression print

grep [options] regex [file...]

grep options
|option|long option|description|
|------|-----------|-----------|
|-i|--ignore-case|Do not distinguish between uppercase and lowercase characters|
|-v|--invert-match|print every line does not contain a match|
|-c|--count|print the number of matches|
|-l|--files-with-matches|print the name of each file contains a match|
|-L|--files-without-match||
|-n|--line-number||

regular expression pattern
* literals
* metacharacters

metacharacters
|meta|explaination|
|----|------------|
|^|start of the line|
|$|end of the line|
|.| any character |
|[]|a set of characters, ^negation, -range|
|{}|
|-|
|?|match an element zero or one time|
|* |match an element zero or more times|match an element zero or one time|
|+|
|()|combine alternation with other regular expression|
|\| | or |
|\|

note: when using [] to match characters, be ware of dictionary order
and ASCII order

for example, make sure that you know the difference of ls /usr/sbin/[ABCDEFG
HIJKLMNOPQRSTUVWXYZ]* vs ls /usr/sbin/[A-Z]*

POSIX character classes
|character class|description|
|---------------|-----------|
|[:alnum:]|In ASCII, [A-Za-z0-9]|
|[:word:]|same as [:alnum:], add _ |
|[:alpha:]|In Ascii, [A-Za-z] |
|[:space:]|In ASCII, [ \t\r\n\v\f] |
|[:upper:]|In ASCII, [A-Z] |
|[:lower:]|In ASCII, [a-z] |

```shell
for i in {1..10};
do
    echo "(${RANDOM:0:3}) ${RANDOM:0:3}-${RANDOM:0:4}" >> phone_list.txt
done

grep -Ev '^\([0-9]{3}\) [0-9]{3}-[0-9]{4}$' phone_list.txt
```



