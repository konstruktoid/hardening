#!/usr/bin/env bats

load test_helper

@test "Verify that apport is disabled in /etc/default/apport" {
  run bash -c "grep '^enabled=0$' /etc/default/apport"
  [ "$status" -eq 0 ]
}

@test "Verify that apport is masked" {
  run isMasked apport.service
  [ "$status" -eq 0 ]
}
