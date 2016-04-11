function f_apport {
  echo "[$i] disable apport"

  sed -i 's/enabled=.*/enabled=0/' /etc/default/apport
  systemctl mask apport.service

  if [[ $VERBOSE == "Y" ]]; then
    systemctl status apport.service --no-pager
    echo
  fi

  ((i++))
}
