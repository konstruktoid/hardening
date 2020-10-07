#!/usr/bin/env bats

load test_helper

@test "Verify root in $SECURITYACCESS" {
  run bash -c "grep '^+:root:127.0.0.1$' $SECURITYACCESS"
  [ "$status" -eq 0 ]
}

@test "Verify console in /etc/securetty" {
  run oneEntry console /etc/securetty 1
  [ "$status" -eq 0 ]
}

@test "Ensure debug-shell is masked" {
  run isMasked debug-shell.service
  [ "$status" -eq 0 ]
}
