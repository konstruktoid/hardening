#!/usr/bin/env bats

@test "Verify aide scheduled check is present" {
  run bash -c "stat /etc/cron.daily/aide || systemctl is-enabled aidecheck.timer"
  [ "$status" -eq 0 ]
}
