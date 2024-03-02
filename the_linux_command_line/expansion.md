## expansion

pathname expansion
```shell
ls

# use * match
echo D*

echo [[:upper::]]*

echo /usr/*/share

# pathname expansion of hidden files
ls -A # almost all
```

tilde expansion
```
echo ~

echo ~foo
```

arithmetic expansion
```
echo $((2 + 2))

echo $(($((5**2)) * 3))

echo $((5 / 2))

echo $((5 % 2))
```

brace expansion
```
echo Front-{A,B,C}-Back

echo Number_{1..5}

echo Number_with_zero_padded_{01..15}
echo Number_with_zero_padded_{001..15}

echo a{A{1,2},B{3,4}}c
```

parameter expansion
```
echo $USER
```

command substitution
```
echo $(ls)

ls -l $(which cp)
```

shell provides quotes to suppress unwanted expansion

double quotes, when text is inside double quotes, all special
characters used by the shell lose their special meaning, except
for $, \(back-slash), `(back-quote)
```
echo "tow word.txt"

echo "$USER $((2+2)) $(cal)"
```

single quotes suppresses all expansions

escaping characters
```
mv bad\&filename good_filename
```

