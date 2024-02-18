#!/usr/bin/env bash 
# 
# Does a 'whois domain-name' lookup on any of 3 alternate servers:
#    ripe.net, cw.net, radb.net

E_NOARGS=75

s_basename=$(basename "$0")
if [ -z "$1" ]; then
    echo "Usage: ${s_basename} [domain-name]"
    exit $E_NOARGS
fi

# check script name and call proper server
case ${s_basename} in   # 0r: case ${0##*/} in
    "wh"     ) whois $1@whois.tucows.com;;
    "wh-ripe") whois $1@whois.ripe.net;;
    "wh-apnic") whois $1@whois.apnic.net;;
    "wh-cw"   ) whois $1@whois.cw.net;;
    *         ) echo "Usage: ${s_basename} [domain-name]";;
esac

exit $?
