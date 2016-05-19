function f_password {
  echo "[$i] $COMMONPASSWD, $COMMONAUTH and $PAMLOGIN"

  sed -i 's/^password[\t].*.pam_cracklib.*/password\trequired\t\t\tpam_cracklib.so retry=3 maxrepeat=3 minlen=15 dcredit=-1 ucredit=-1 ocredit=-1 lcredit=-1 difok=8/' "$COMMONPASSWD"
  sed -i 's/try_first_pass sha512.*/try_first_pass sha512 remember=24/' "$COMMONPASSWD"
  sed -i 's/nullok_secure//' "$COMMONAUTH"

  if ! grep tally "$COMMONAUTH"; then
    sed -i '/^$/a auth required pam_tally.so file=/var/log/faillog deny=5 unlock_time=900' "$COMMONAUTH"
    sed -i '/pam_tally.so/d' "$COMMONACCOUNT"
    echo 'account required pam_tally.so reset' >> "$COMMONACCOUNT"
  fi

  sed -i 's/pam_lastlog.so.*/pam_lastlog.so showfailed/' "$PAMLOGIN"
  sed -i 's/delay=.*/delay=4000000/' "$PAMLOGIN"

  ((i++))
}
