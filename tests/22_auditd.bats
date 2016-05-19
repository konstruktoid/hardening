#!/usr/bin/env bats

load test_helper

@test "Verify $AUDITDCONF settings" {
  skip "Work in progress."
  }

@test "Verify that audit is enabled" {
  run bash -c "grep '^GRUB_CMDLINE_LINUX=\".*audit=1.*\"' $DEFAULTGRUB"
  [ "$status" -eq 0 ]
}

@test "Verify auditd is enabled" {
  run systemctl is-enabled auditd.service
  [ "$status" -eq 0 ]
}
