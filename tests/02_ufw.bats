#!/usr/bin/env bats

load test_helper

@test "Verify that UFW is installed" {
  run bash -c "dpkg -l | grep ii.*ufw.*firewall"
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
