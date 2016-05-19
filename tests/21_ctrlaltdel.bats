#!/usr/bin/env bats

load test_helper

@test "Ensure ctrl-alt-del is masked" {
  run isMasked ctrl-alt-del.target
  [ "$status" -eq 0 ]
}
