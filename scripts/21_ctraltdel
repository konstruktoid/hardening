function f_ctrlaltdel {
  echo "[$i] Ctrl-alt-delete"

  systemctl mask ctrl-alt-del.target

  sed -i 's/^#CtrlAltDelBurstAction=.*/CtrlAltDelBurstAction=none/' "$SYSTEMCONF"

  if [[ $VERBOSE == "Y" ]]; then
    systemctl status ctrl-alt-del.target --no-pager
    echo
  fi

  ((i++))
}
