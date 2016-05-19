function f_rootaccess {
  echo "[$i] root access"

  sed -i 's/^#+ : root : 127.0.0.1/+ : root : 127.0.0.1/' "$SECURITYACCESS"
  echo "console" > /etc/securetty

  ((i++))
}
