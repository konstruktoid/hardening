#!/usr/bin/env bats

load test_helper

@test "Verify that rkhunter runs daily" {
  run bash -c "grep '^CRON_DAILY_RUN=\"yes\"$' $RKHUNTERCONF"
  [ "$status" -eq 0 ]
}

@test "Verify that rkhunter autogen is enabled" {
  run bash -c "grep '^APT_AUTOGEN=\"yes\"$' $RKHUNTERCONF"
  [ "$status" -eq 0 ]
}
