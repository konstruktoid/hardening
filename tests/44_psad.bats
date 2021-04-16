#!/usr/bin/env bats

load test_helper

@test "Verify PSAD is installed" {
  run bash -c "command -v psad > /dev/null 2>&1"
  [ "$status" -eq 0 ]
}
