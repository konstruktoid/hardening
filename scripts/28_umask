function f_umask {
  echo "[$i] umask"

  if [ -f /etc/init.d/rc ]; then
    sed -i 's/umask 022/umask 027/g' /etc/init.d/rc
  fi

  if ! grep -q -i "umask" "/etc/profile" 2> /dev/null; then
    echo "umask 027" >> /etc/profile
  fi

  if ! grep -q -i "umask" "/etc/bash.bashrc" 2> /dev/null; then
    echo "umask 027" >> /etc/bash.bashrc
  fi

  ((i++))

}
