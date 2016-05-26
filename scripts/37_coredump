function f_coredump {
  if test -f "$COREDUMPCONF"; then

    echo "[$i] Systemd/coredump.conf"
    sed -i 's/^#Storage=.*/Storage=none/' "$COREDUMPCONF"

    systemctl restart systemd-journald

    if [[ $VERBOSE == "Y" ]]; then
      systemctl status systemd-journald --no-pager
      echo
    fi

    ((i++))
  fi
}
