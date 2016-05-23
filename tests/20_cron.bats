#!/usr/bin/env bats

load test_helper

@test "Ensure /etc/cron.deny is removed" {
  run test -f /etc/cron.deny
  [ "$status" -eq 1 ]
}

@test "Ensure /etc/at.deny is removed" {
  run test -f /etc/at.deny
  [ "$status" -eq 1 ]
}

@test "Verify root in /etc/cron.allow" {
  run oneEntry root /etc/cron.allow 1
  [ "$status" -eq 0 ]
}

@test "Verify root in /etc/at.allow" {
  run oneEntry root /etc/at.allow 1
  [ "$status" -eq 0 ]
}

@test "Ensure atd is masked" {
  run isMasked atd.service
  [ "$status" -eq 0 ]
}

@test "Verify cron logging is enabled" {
  run bash -c "grep '^cron.\*.*/var/log/cron.log$' /etc/rsyslog.d/50-default.conf"
  [ "$status" -eq 0 ]
}
