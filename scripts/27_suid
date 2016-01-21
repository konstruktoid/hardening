function f_suid {
  echo "[$i] Remove suid bits"

  for p in /bin/fusermount /bin/mount /bin/ping /bin/ping6 /bin/su /bin/umount /usr/bin/bsd-write /usr/bin/chage /usr/bin/chfn /usr/bin/chsh /usr/bin/mlocate /usr/bin/mtr /usr/bin/newgrp /usr/bin/pkexec /usr/bin/traceroute6.iputils /usr/bin/wall /usr/sbin/pppd;
  do
    if [ -e "$p" ]; then
      oct=$(stat -c "%a" $p |sed 's/^4/0/')
      ug=$(stat -c "%U %G" $p)
      dpkg-statoverride --remove $p 2> /dev/null
      dpkg-statoverride --add "$ug" "$oct" $p 2> /dev/null
      chmod -s $p
    fi
  done

  for SHELL in $(cat /etc/shells); do
    if [ -x "$SHELL" ]; then
      chmod -s "$SHELL"
    fi
  done

  ((i++))
}
