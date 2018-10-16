#!/usr/bin/env bats

load test_helper

@test "Ensure that there's no coredump storage in $COREDUMPCONF" {
  run bash -c "grep '^Storage=none$' $COREDUMPCONF"
  [ "$status" -eq 0 ]
}

@test "Verify ProcessSizeMax in $COREDUMPCONF" {
  run bash -c "grep '^ProcessSizeMax=0$' $COREDUMPCONF"
  [ "$status" -eq 0 ]
}
