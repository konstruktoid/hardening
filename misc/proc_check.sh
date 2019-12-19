#!/bin/bash

echo "[i] Service|User, NOFILE, NPROC"
echo "[i] system ulimit: $(ulimit -n | awk '{print $NF}'), $(ulimit -u | awk '{print $NF}')"
echo
echo "[i] systemd limits:"

if [ "$1" == "all" ]; then
  for x in $(systemctl --state=running --state=active | grep -E '.*\.service' | grep -v '@' | awk '{print $1}'); do
    echo "$x:"
    systemctl show "$x" | grep -iE 'nofile|nproc'
    echo
  done
fi

while read -r u; do
  echo "$u:"
  systemctl show "user@(id -n $u).service" | grep -Ei 'nofile|nproc'
  echo
done <<< "$(awk -F ':' '{print $1}' /etc/passwd)"
