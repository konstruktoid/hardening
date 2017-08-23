#!/bin/sh
echo "username, pid, fd count"
for p in $(awk -F ":" '{print $1}' /etc/passwd); do
  for u in $(ps -C "$p" -o pid=); do
    fdc="$(find /proc/"$u"/fd/ | wc -l)"
    echo "$p, $u, $fdc"
  done
done
