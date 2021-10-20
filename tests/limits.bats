#!/usr/bin/env bats

load test_helper

@test "Verify maxlogins in $LIMITSCONF" {
  run bash -c "grep '^* hard maxlogins 10$' $LIMITSCONF"
  [ "$status" -eq 0 ]
}

@test "Verify hard core in $LIMITSCONF" {
  run bash -c "grep '^* hard core 0$' $LIMITSCONF"
  [ "$status" -eq 0 ]
}

@test "Verify soft nproc in $LIMITSCONF" {
  run bash -c "grep '^* soft nproc 512$' $LIMITSCONF"
  [ "$status" -eq 0 ]
}

@test "Verify hard nproc in $LIMITSCONF" {
  run bash -c "grep '^* hard nproc 1024$' $LIMITSCONF"
  [ "$status" -eq 0 ]
}
