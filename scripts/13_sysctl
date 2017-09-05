function f_sysctl {
  echo "[$i] $SYSCTL"

  cp "$SYSCTL_CONF" "$SYSCTL"

  sed -i '/net.ipv6.conf.eth0.accept_ra_rtr_pref/d' "$SYSCTL"

  for n in $(arp -n -a | awk '{print $NF}' | sort | uniq); do
    echo "net.ipv6.conf.$n.accept_ra_rtr_pref = 0" >> "$SYSCTL"
  done

  if [ -f /sys/module/nf_conntrack/parameters/hashsize ]; then
    echo 1048576 > /sys/module/nf_conntrack/parameters/hashsize
  fi

  chmod 0600 "$SYSCTL"
  systemctl restart systemd-sysctl

  if [[ $VERBOSE == "Y" ]]; then
    systemctl status systemd-sysctl --no-pager
    echo
  fi

  ((i++))
}
