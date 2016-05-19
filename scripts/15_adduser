function f_adduser {
  echo "[$i] $ADDUSER and $USERADD"

  sed -i 's/DSHELL=.*/DSHELL=\/bin\/false/' "$ADDUSER"
  sed -i 's/SHELL=.*/SHELL=\/bin\/false/' "$USERADD"
  sed -i 's/^# INACTIVE=.*/INACTIVE=35/' "$USERADD"

  ((i++))
}
