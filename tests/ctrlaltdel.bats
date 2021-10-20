#!/usr/bin/env bats

load test_helper

@test "Ensure ctrl-alt-del is masked" {
  run isMasked ctrl-alt-del.target
  [ "$status" -eq 0 ]
}

@test "Verify CtrlAltDelBurstAction in $SYSTEMCONF" {
  run bash -c "grep '^CtrlAltDelBurstAction=none$' $SYSTEMCONF"
  [ "$status" -eq 0 ]
}
