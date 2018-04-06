#!/usr/bin/env bats

@test "Verify /usr/bin/make permission" {
  run bash -c "stat -c %a /usr/bin/make | grep 750"
  [ "$status" -eq 0 ]
}
