#!/usr/bin/env bash
# this shell script show usage of quoting in shell scripts
#
# created by jiasheng, 02/13 2024

# quoting means just that, bracketing a string in quotes
# quoting has the effect of protecting special characters in the string
# from reinterpretation or expansion by the shell or shell script

# for example
# ls -l[Vv]* vs ls -l '[Vv]*'

echo $(ls -l)

echo "$(ls -l)"
