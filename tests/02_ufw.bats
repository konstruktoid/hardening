#!/usr/bin/env bats

load test_helper

@test "Verify UFW is installed and default deny policy" {
  run bash -c "ufw status verbose | grep 'deny (incoming)'"
  [ "$status" -eq 0 ]
}

@test "Verify that UFW is enabled" {
  run bash -c "systemctl is-enabled ufw"
  [ "$status" -eq 0 ]
}

@test "Verify that UFW uses $SYSCTL in $UFWDEFAULT" {
  run bash -c "grep \"^IPT_SYSCTL=$SYSCTL$\" $UFWDEFAULT"
  [ "$status" -eq 0 ]
}
