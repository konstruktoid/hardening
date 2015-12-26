function f_rhosts {
  echo "[$i] .rhosts"

  for dir in $(awk -F ":" '{print $6}' /etc/passwd); do
    find "$dir" \( -name "hosts.equiv" -o -name ".rhosts" \) -exec rm -f {} \; 2> /dev/null
      if [[ -f /etc/hosts.equiv ]]; then
        rm /etc/hosts.equiv
      fi
  done

  ((i++))
}
