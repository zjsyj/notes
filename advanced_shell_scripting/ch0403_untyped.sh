#!/usr/bin/env bash
# this script shows that bash variables are character strings
# depending on context bash permits arithmetic operations and 
# comparisons on variables
#
# created by jiasheng, 02/16 2024
echo "shell script name: $0"

a=2334  # Integer
let "a += 1"
echo "a = $a"
echo ""

b=${a/23/BB} # substitute BB for 23
echo "b=$b"

declare -i b # declare it an integer doesn't help
echo "b=$b"
echo ""

e=''
echo "e=$e"

let "e += 1"
echo "e=$e"
echo ""

exit $?
