#!/usr/bin/env bats

load test_helper

@test "Verify that apport is not installed" {
  run packageInstalled 'apport'
  [ "$status" -eq 1 ]
}

@test "Verify that /etc/default/apport do not exist" {
  run bash -c "stat /etc/default/apport"
  [ "$status" -eq 1 ]
}

@test "Verify that whoopsie is not installed" {
  run packageInstalled 'whoopsie'
  [ "$status" -eq 1 ]
}

@test "Verify that /etc/default/whoopsie do not exist" {
  run bash -c "stat /etc/default/whoopsie"
  [ "$status" -eq 1 ]
}
