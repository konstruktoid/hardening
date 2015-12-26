function f_aa_enforce {
  echo "[$i] Enforce apparmor profiles"

  find /etc/apparmor.d/ -maxdepth 1 -type f -exec aa-enforce {} \;
  aa-complain /etc/apparmor.d/usr.sbin.rsyslogd

  ((i++))
}
