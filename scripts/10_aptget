function f_aptget {
  echo "[$i] Updating the package index files from their sources"

  $APT update

  ((i++))

  echo "[$i] Upgrading installed packages"

  $APT upgrade

  ((i++))
}

function f_aptget_clean {
  echo "[$i] Removing unused packages"

  $APT clean
  $APT autoclean
  apt-get -qq autoremove

  ((i++))
}
