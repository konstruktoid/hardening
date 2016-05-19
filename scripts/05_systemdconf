function f_systemdconf {
  echo "[$i] Systemd/system.conf and Systemd/user.conf"

  sed -i 's/^#DumpCore=.*/DumpCore=no/' "$SYSTEMCONF"
  sed -i 's/^#CrashShell=.*/CrashShell=no/' "$SYSTEMCONF"
  sed -i 's/^#DefaultLimitCORE=.*/DefaultLimitCORE=0/' "$SYSTEMCONF"
  sed -i 's/^#DefaultLimitNOFILE=.*/DefaultLimitNOFILE=100/' "$SYSTEMCONF"
  sed -i 's/^#DefaultLimitNPROC=.*/DefaultLimitNPROC=100/' "$SYSTEMCONF"

  sed -i 's/^#DefaultLimitCORE=.*/DefaultLimitCORE=0/' "$USERCONF"
  sed -i 's/^#DefaultLimitNOFILE=.*/DefaultLimitNOFILE=100/' "$USERCONF"
  sed -i 's/^#DefaultLimitNPROC=.*/DefaultLimitNPROC=100/' "$USERCONF"

  systemctl daemon-reload

  ((i++))
}

