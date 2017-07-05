#!/bin/sh
PRIFILE="$(mktemp)"
echo "$PRIFILE"
for x in $(lsblk  -n | awk '{print $NF}' | grep -E -v '[SWAP]|disk|part' | sort | uniq); do
  for f in $(sudo find "$x" -xdev -type f -perm -4000 -o -type f -perm -2000 2>/dev/null); do
    if sudo stat -c %A "$f" | grep 'x' 2>/dev/null 1>&2; then
       echo "-a always,exit -F path=$f -F perm=x -F auid>=1000 -F auid!=4294967295 -F key=privileged" >> "$PRIFILE"
    fi
  done
done

sort "$PRIFILE" | uniq

rm "$PRIFILE"
