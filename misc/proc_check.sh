#!/bin/sh

echo "Service|User, NOFILE, NPROC"
echo "system ulimit, $(ulimit -n | awk '{print $NF}'), $(ulimit -u | awk '{print $NF}')"

for x in $(systemctl --state=running --state=active | grep -E '.*\.service' | awk '{print $1}'); do 
	echo "$x, $(systemctl show "$x" | grep -i 'nofile' | sed 's/.*=//g'), $(systemctl show "$x" | grep -i 'nproc' | sed 's/.*=//g')"
done

for u in $(awk -F ':' '{print $1}' /etc/passwd); do 
	echo "$u, $(systemctl show "user@(id -n $u).service" | grep -i 'nofile' | sed 's/.*=//g'), $(systemctl show "user@(id -n $u).service" | grep -i 'nproc' | sed 's/.*=//g')"
done
