function f_logindefs {
  echo "[$i] /etc/login.defs"

  sed -i 's/^.*LOG_OK_LOGINS.*/LOG_OK_LOGINS\t\tyes/' "$LOGINDEFS"
  sed -i 's/^UMASK.*/UMASK\t\t077/' "$LOGINDEFS"
  sed -i 's/^PASS_MIN_DAYS.*/PASS_MIN_DAYS\t\t7/' "$LOGINDEFS"
  sed -i 's/^PASS_MAX_DAYS.*/PASS_MAX_DAYS\t\t30/' "$LOGINDEFS"
  sed -i 's/DEFAULT_HOME.*/DEFAULT_HOME no/' "$LOGINDEFS"
  sed -i 's/USERGROUPS_ENAB.*/USERGROUPS_ENAB no/' "$LOGINDEFS"
  sed -i 's/^# SHA_CRYPT_MAX_ROUNDS.*/SHA_CRYPT_MAX_ROUNDS\t\t10000/' "$LOGINDEFS"

  ((i++))
}
