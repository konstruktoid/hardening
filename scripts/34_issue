function f_issue {
  echo "[$i] /etc/issue"

  for f in /etc/issue /etc/issue.net /etc/motd; do
    TEXT="\nAuthorized users only. All activity may be monitored and reported.\n"
    echo -e "$TEXT" > $f
  done

  ((i++))
}
