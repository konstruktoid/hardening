#!/usr/bin/env bats

load test_helper

@test "Ensure root account is locked" {
  run isLocked root
  [ "$status" -eq 0 ]
}
