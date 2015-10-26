function f_hosts {
  echo "[$i] /etc/hosts.allow and /etc/hosts.deny"

  echo "sshd : ALL : ALLOW" > /etc/hosts.allow
  echo "ALL: LOCAL, 127.0.0.1" >> /etc/hosts.allow
  echo "ALL: PARANOID" > /etc/hosts.deny
  chmod 644 /etc/hosts.allow
  chmod 644 /etc/hosts.deny

  ((i++))
}
