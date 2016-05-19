#!/usr/bin/env bats

load test_helper

@test "Verify that acct is installed" {
  run bash -c "dpkg -l | grep ^ii.*acct"
  [ "$status" -eq 0 ]
}

@test "Verify that aide-common is installed" {
  run bash -c "dpkg -l | grep ^ii.*aide-common"
  [ "$status" -eq 0 ]
}

@test "Verify that apparmor-profiles is installed" {
  run bash -c "dpkg -l | grep ^ii.*apparmor-profiles"
  [ "$status" -eq 0 ]
}

@test "Verify that apparmor-utils is installed" {
  run bash -c "dpkg -l | grep ^ii.*apparmor-utils"
  [ "$status" -eq 0 ]
}

@test "Verify that auditd is installed" {
  run bash -c "dpkg -l | grep ^ii.*auditd"
  [ "$status" -eq 0 ]
}

@test "Verify that debsums is installed" {
  run bash -c "dpkg -l | grep ^ii.*debsums"
  [ "$status" -eq 0 ]
}

@test "Verify that haveged is installed" {
  run bash -c "dpkg -l | grep ^ii.*haveged"
  [ "$status" -eq 0 ]
}

@test "Verify that libpam-cracklib is installed" {
  run bash -c "dpkg -l | grep ^ii.*libpam-cracklib"
  [ "$status" -eq 0 ]
}

@test "Verify that libpam-tmpdir is installed" {
  run bash -c "dpkg -l | grep ^ii.*libpam-tmpdir"
  [ "$status" -eq 0 ]
}

@test "Verify that openssh-server is installed" {
  run bash -c "dpkg -l | grep ^ii.*openssh-server"
  [ "$status" -eq 0 ]
}

@test "Verify that postfix is installed" {
  run bash -c "dpkg -l | grep ^ii.*postfix"
  [ "$status" -eq 0 ]
}

@test "Verify that rkhunter is installed" {
  run bash -c "dpkg -l | grep ^ii.*rkhunter"
  [ "$status" -eq 0 ]
}
