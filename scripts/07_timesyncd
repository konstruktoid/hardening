function f_timesyncd {
  echo "[$i] Systemd/timesyncd.conf"
  LATENCY="50"
  SERVERS="4"
  APPLY="YES"
  CONF="$TIMESYNCD"
  SERVERARRAY=()
  FALLBACKARRAY=()
  TMPCONF=$(mktemp --tmpdir ntpconf.XXXXX)

  if [[ -z "$NTPSERVERPOOL" ]]; then
    NTPSERVERPOOL="0.ubuntu.pool.ntp.org 1.ubuntu.pool.ntp.org 2.ubuntu.pool.ntp.org 3.ubuntu.pool.ntp.org pool.ntp.org"
  fi

  echo "[Time]" > "$TMPCONF"

  PONG="ping -c2"

  for s in $(dig +noall +answer +nocomments $NTPSERVERPOOL | awk '{print $5}'); do
    if [[ $NUMSERV -ge $SERVERS ]]; then
      break
    fi

    PINGSERV=$($PONG "$s" | grep 'rtt min/avg/max/mdev' | awk -F "/" '{printf "%.0f\n",$6}')
    if [[ $PINGSERV -gt "1" && $PINGSERV -lt "$LATENCY" ]]; then
      OKSERV=$(nslookup "$s"|grep "name = " | awk '{print $4}'|sed 's/.$//')
      if [[ $OKSERV && $NUMSERV -lt $SERVERS && ! (( $(grep "$OKSERV" "$TMPCONF") )) ]]; then
        echo "$OKSERV has latency < $LATENCY"
        SERVERARRAY+=("$OKSERV")
        ((NUMSERV++))
      fi
    fi
  done

  for l in $NTPSERVERPOOL; do
    if [[ $FALLBACKSERV -le "2" ]]; then
      FALLBACKARRAY+=("$l")
      ((FALLBACKSERV++))
    else
      break
    fi
  done

  if [[ ${#SERVERARRAY[@]} -le "2" ]]; then
    for s in $(echo "$NTPSERVERPOOL" | awk '{print $(NF-1),$NF}'); do
      SERVERARRAY+=("$s")
    done
  fi

  echo "NTP=${SERVERARRAY[@]}" >> "$TMPCONF"
  echo "FallbackNTP=${FALLBACKARRAY[@]}" >> "$TMPCONF"

  if [[ $APPLY = "YES" ]]; then
    cat "$TMPCONF" > "$CONF"
    systemctl restart systemd-timesyncd
    rm "$TMPCONF"
  else
    echo "Configuration saved to $TMPCONF."
  fi

  if [[ $VERBOSE == "Y" ]]; then
    systemctl status systemd-timesyncd --no-pager
    echo
  fi

  ((i++))
}
