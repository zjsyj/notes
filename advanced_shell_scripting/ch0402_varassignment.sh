#!/usr/bin/env bash
# this shell script talks about variable assignment
# **note** that = can be an assignment or a test operator
#
# created by jiasheng, 02/12 2024
a=879
echo "The vaue of \"a\" is ${a}"

# assignment using 'let'
let a=16+5
echo "The value of \"a\" is ${a}"

echo ""

echo -n "Values of \"a\" in the loop are:"
for a in 7 8 9 11
do
    echo -n "$a "
done

echo ""
echo ""

echo -n "Enter \"a\" "
read a
echo "The value of \"a\" is $a"

echo ""


# plain and fancier
a=23
echo $a
b=$a

# assign result of 'echo' command to 'a'
a=$(echo Hello!) # `echo Hello!` works too,but $() is a newer way
echo $a

a=$(ls -l)
# assign result of `ls -l` to 'a'
# unquoted, however, it removes tabs and newlines
# the quoted variable preserves whitespace.
echo $a
echo ""
echo "$a"

exit 0
