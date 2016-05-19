function f_disablenet {
  echo "[$i] Disable misc network protocols"

  NET="dccp sctp rds tipc"
  for disable in $NET; do
    if ! grep -q "$disable" "$DISABLENET" 2> /dev/null; then
      echo "install $disable /bin/true" >> "$DISABLENET"
    fi
  done

  ((i++))
}
