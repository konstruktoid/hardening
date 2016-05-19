#!/usr/bin/env bats

@test "Verify umask in /etc/init.d/rc" {
  run bash -c "grep '^umask 027$' /etc/init.d/rc"
  [ "$status" -eq 0 ]
}

@test "Verify umask in /etc/profile" {
  run bash -c "grep '^umask 027$' /etc/profile"
  [ "$status" -eq 0 ]
}

@test "Verify umask in /etc/bash.bashrc" {
  run bash -c "grep '^umask 027$' /etc/bash.bashrc"
  [ "$status" -eq 0 ]
}
