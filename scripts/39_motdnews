function f_motdnews {
  if test -f /etc/default/motd-news; then
    echo "[$i] disable motd-news"
    sed -i 's/ENABLED=.*/ENABLED=0/' /etc/default/motd-news
    systemctl disable motd-news.timer

    if [[ $VERBOSE == "Y" ]]; then
      systemctl status motd-news.timer --no-pager
      echo
    fi

    ((i++))
  fi
}
