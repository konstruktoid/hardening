#!/usr/bin/env bats

@test "Ensure user games is removed" {
  run bash -c "grep '^games' /etc/passwd"
  [ "$status" -eq 1 ]
}

@test "Ensure user gnats is removed" {
  run bash -c "grep '^gnats' /etc/passwd"
  [ "$status" -eq 1 ]
}

@test "Ensure user irc is removed" {
  run bash -c "grep '^irc' /etc/passwd"
  [ "$status" -eq 1 ]
}

@test "Ensure user list is removed" {
  run bash -c "grep '^list' /etc/passwd"
  [ "$status" -eq 1 ]
}

@test "Ensure user news is removed" {
  run bash -c "grep '^news' /etc/passwd"
  [ "$status" -eq 1 ]
}

@test "Ensure user sync is removed" {
  run bash -c "grep '^sync' /etc/passwd"
  [ "$status" -eq 1 ]
}

@test "Ensure user uucp is removed" {
  run bash -c "grep '^uucp' /etc/passwd"
  [ "$status" -eq 1 ]
}
