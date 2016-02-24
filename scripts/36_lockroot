function f_lockroot {
  echo "[$i] lock root account"

  usermod -L root

  if [[ $VERBOSE == "Y" ]]; then
    passwd -S root
    echo
  fi

  ((i++))
}
