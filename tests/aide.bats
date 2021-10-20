#!/usr/bin/env bats

@test "Verify aide cron.daily is present" {
  run bash -c "stat /etc/cron.daily/aide"
  [ "$status" -eq 0 ]
}

@test "Verify aide timer is enabled" {
  run bash -c "systemctl is-enabled aidecheck.timer"
  [ "$status" -eq 0 ]
}
