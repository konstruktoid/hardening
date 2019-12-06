#!/usr/bin/env bats

@test "Verify that lockdown=confidentiality is used (kernel 5.X)" {
  run bash -c "grep 'lockdown=confidentiality' /proc/cmdline"
  [ "$status" -eq 0 ]
}
