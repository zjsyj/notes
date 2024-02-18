#!/usr/bin/env bash
# this script shows some special variable type
# created 02/16 2024

# local variables are visible only within a code block or function
# environment variables will affect the behavior of the shell and
# user interface
#
# A script can export variable only to child processes
# child processes can't export environment variables back
# to the parent processes that spawned them
#

# positional parameters are arguments passed to the script from
# the command line: $0, $1, $2 ...
# $* and $@ denote all the positional parameters

MINPARAMS=10
echo ""

echo "the name of this script is \"$0\"."
echo "The name of this script is \"$(basename $0)\"."
echo ""

if [ -n "$1" ]; then
    echo "parameter #1 is $1"
fi

if [ -n "${10}" ]; then
    echo "parameter #10 is ${10}"
fi

echo ""
echo "------------------------------"
echo "All the command line parameters are: "$*""
if [ $# -lt "$MINPARAMS" ]; then
    echo ""
    echo "This script needs at least $MINPARAMS command line parameters"
fi

until [ -z "$1" ]; do
    echo -n "$1"
    shift
done

exit 0
