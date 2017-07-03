function f_postfix {
  echo "[$i] Postfix"

  postconf -e disable_vrfy_command=yes

  systemctl restart postfix.service

  if [[ $VERBOSE == "Y" ]];
    then
       systemctl status postfix.service --no-pager
    echo
  fi

  ((i++))
}
