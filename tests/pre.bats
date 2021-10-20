#!/usr/bin/env bats

@test "Verify that we're using Ubuntu" {
  run bash -c "lsb_release -i | grep 'Ubuntu'"
  [ "$status" -eq 0 ]
}
