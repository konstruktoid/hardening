#!/usr/bin/env bats

load test_helper

@test "Verify that acct is installed" {
  run packageInstalled 'acct'
  [ "$status" -eq 0 ]
}

@test "Verify that aide-common is installed" {
  run packageInstalled 'aide-common'
  [ "$status" -eq 0 ]
}

@test "Verify that apparmor-profiles is installed" {
  run packageInstalled 'apparmor-profiles'
  [ "$status" -eq 0 ]
}

@test "Verify that apparmor-utils is installed" {
  run packageInstalled 'apparmor-utils'
  [ "$status" -eq 0 ]
}

@test "Verify that auditd is installed" {
  run packageInstalled 'auditd'
  [ "$status" -eq 0 ]
}

@test "Verify that debsums is installed" {
  run packageInstalled 'debsums'
  [ "$status" -eq 0 ]
}

@test "Verify that haveged is installed" {
  run packageInstalled 'haveged'
  [ "$status" -eq 0 ]
}

@test "Verify that libpam-cracklib is installed" {
  run packageInstalled 'libpam-cracklib'
  [ "$status" -eq 0 ]
}

@test "Verify that libpam-tmpdir is installed" {
  run packageInstalled 'libpam-tmpdir'
  [ "$status" -eq 0 ]
}

@test "Verify that openssh-server is installed" {
  run packageInstalled 'openssh-server'
  [ "$status" -eq 0 ]
}

@test "Verify that postfix is installed" {
  run packageInstalled 'postfix'
  [ "$status" -eq 0 ]
}

@test "Verify that rkhunter is installed" {
  run packageInstalled 'rkhunter'
  [ "$status" -eq 0 ]
}

@test "Verify that vlock is installed" {
  run packageInstalled 'vlock'
  [ "$status" -eq 0 ]
}

@test "Verify that libpam-apparmor is installed" {
  run packageInstalled 'libpam-apparmor'
  [ "$status" -eq 0 ]
}

@test "Verify that avahi is not installed" {
  run packageInstalled 'avahi'
  [ "$status" -eq 1 ]
}

@test "Verify that beep is not installed" {
  run packageInstalled 'beep'
  [ "$status" -eq 1 ]
}

@test "Verify that popularity-contest is not installed" {
  run packageInstalled 'popularity-contest'
  [ "$status" -eq 1 ]
}

@test "Verify that rsh is not installed" {
  run packageInstalled 'rsh'
  [ "$status" -eq 1 ]
}

@test "Verify that talk is not installed" {
  run packageInstalled 'talk'
  [ "$status" -eq 1 ]
}

@test "Verify that telnet is not installed" {
  run packageInstalled 'telnet'
  [ "$status" -eq 1 ]
}

@test "Verify that tftp is not installed" {
  run packageInstalled 'tftp'
  [ "$status" -eq 1 ]
}

@test "Verify that yp-tools is not installed" {
  run packageInstalled 'yp-tools'
  [ "$status" -eq 1 ]
}

@test "Verify that ypbind is not installed" {
  run packageInstalled 'ypbind'
  [ "$status" -eq 1 ]
}

@test "Verify that xinetd is not installed" {
  run packageInstalled 'xinetd'
  [ "$status" -eq 1 ]
}
