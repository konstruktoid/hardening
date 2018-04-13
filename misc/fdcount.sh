#!/bin/bash
echo "username, pid, fd count"

while read -r p; do
  for u in $(ps -C "$p" -o pid=); do
    fdc="$(find /proc/"$u"/fd/ | wc -l)"
    echo "$p, $u, $fdc"
  done
done <<< "$(awk -F ":" '{print $1}' /etc/passwd)"
