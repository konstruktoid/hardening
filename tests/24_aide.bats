#!/usr/bin/env bats

@test "Verify aide timer is enabled" {
  run bash -c "systemctl is-enabled aidecheck.timer"
  [ "$status" -eq 0 ]
}
