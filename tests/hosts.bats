#!/usr/bin/env bats

@test "Verify /etc/hosts.deny" {
  run bash -c "grep '^ALL: ALL$' /etc/hosts.deny"
  [ "$status" -eq 0 ]
}

@test "Verify /etc/hosts.allow" {
  run bash -c "grep '^ALL: LOCAL, 127.0.0.1$' /etc/hosts.allow"
  [ "$status" -eq 0 ]
}
