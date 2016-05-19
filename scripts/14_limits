function f_limitsconf {
  echo "[$i] $LIMITSCONF"

  sed -i 's/^# End of file*//' "$LIMITSCONF"
  echo "* hard maxlogins 10" >> "$LIMITSCONF"
  echo "* hard core 0" >> "$LIMITSCONF"
  echo "* soft nproc 100" >> "$LIMITSCONF"
  echo "* hard nproc 150" >> "$LIMITSCONF"
  echo "# End of file" >> "$LIMITSCONF"

  ((i++))
}
