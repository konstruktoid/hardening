#!/usr/bin/env bats

@test "Verify aide timer is enabled" {
  run systemctl is-enabled aidecheck.timer
  [ "$status" -eq 0 ]
}
