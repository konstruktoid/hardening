function f_users {
  echo "[$i] Remove users"

  for users in games gnats irc list news uucp; do
    userdel -r "$users" 2> /dev/null
  done

  ((i++))
}
