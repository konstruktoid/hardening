#!/usr/bin/env bats

@test "Verify umask in /etc/profile" {
  run bash -c "grep '^umask 077$' /etc/profile"
  [ "$status" -eq 0 ]
}

@test "Verify umask in /etc/bash.bashrc" {
  run bash -c "grep '^umask 077$' /etc/bash.bashrc"
  [ "$status" -eq 0 ]
}

@test "Verify TMOUT in /etc/profile.d/autologout.sh" {
  run bash -c "grep '^TMOUT=600$' /etc/profile.d/autologout.sh"
  [ "$status" -eq 0 ]
}

@test "Verify readonly TMOUT in /etc/profile.d/autologout.sh" {
  run bash -c "grep '^readonly TMOUT$' /etc/profile.d/autologout.sh"
  [ "$status" -eq 0 ]
}
