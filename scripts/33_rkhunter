function f_rkhunter {
  echo "[$i] Enable rkhunter"

  sed -i 's/^CRON_DAILY_RUN=.*/CRON_DAILY_RUN="yes"/' "$RKHUNTERCONF"
  sed -i 's/^APT_AUTOGEN=.*/APT_AUTOGEN="yes"/' "$RKHUNTERCONF"

  rkhunter --propupd

  ((i++))
}
