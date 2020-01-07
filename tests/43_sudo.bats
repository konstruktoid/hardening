#!/usr/bin/env bats

@test "Verify sudo use_pty" {
  run bash -c "grep -qER '^Defaults.*use_pty$' /etc/sudo*"
  [ "$status" -eq 0 ]
}

@test "Verify sudo custom logfile" {
  run bash -c "grep -qER '^Defaults.*logfile' /etc/sudo*"
  [ "$status" -eq 0 ]
}
