function f_firewall {
  echo "[$i] Enable ufw"

  if ! test -f "$UFWDEFAULT"; then
    echo "$UFWDEFAULT does not exist."

    if ! dpkg -l | grep ufw 2> /dev/null 1>&2; then
      echo 'ufw package is not installed.'
    fi

    return
  fi

  sed -i 's/IPT_SYSCTL=.*/IPT_SYSCTL=\/etc\/sysctl\.conf/' "$UFWDEFAULT"
  ufw --force enable

  for admin in $FW_ADMIN; do
    ufw allow log from "$admin" to any port 22 proto tcp
  done

  if [[ $VERBOSE == "Y" ]]; then
    systemctl status ufw.service --no-pager
    ufw status verbose
    echo
  fi

  ((i++))
}
