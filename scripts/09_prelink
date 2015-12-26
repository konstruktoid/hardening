function f_prelink {
  echo "[$i] Prelink"

  if dpkg -l | grep prelink 1> /dev/null; then
    "$(which prelink)" -ua 2> /dev/null
    "$APT" purge prelink
  fi

  ((i++))
}
