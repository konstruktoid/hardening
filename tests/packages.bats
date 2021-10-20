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

@test "Verify that apparmor is installed" {
  run packageInstalled 'apparmor'
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

@test "Verify that audispd-plugins is installed" {
  run packageInstalled 'audispd-plugins'
  [ "$status" -eq 0 ]
}

@test "Verify that debsums is installed" {
  run packageInstalled 'debsums'
  [ "$status" -eq 0 ]
}

@test "Verify that gnupg2 is installed" {
  run packageInstalled 'gnupg2'
  [ "$status" -eq 0 ]
}

@test "Verify that haveged is installed" {
  run packageInstalled 'haveged'
  [ "$status" -eq 0 ]
}

@test "Verify that libpam-pwquality is installed" {
  run packageInstalled 'libpam-pwquality'
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

@test "Verify that tcpd is installed" {
  run packageInstalled 'tcpd'
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

@test "Verify that needrestart is installed" {
  run packageInstalled 'needrestart'
  [ "$status" -eq 0 ]
}

@test "Verify that sysstat is installed" {
  run packageInstalled 'sysstat'
  [ "$status" -eq 0 ]
}

@test "Verify that sysstat is enabled" {
  run bash -c 'grep ENABLED=\"true\" /etc/default/sysstat'
  [ "$status" -eq 0 ]
}

@test "Verify that update-notifier-common is installed" {
  run packageInstalled 'update-notifier-common'
  [ "$status" -eq 0 ]
}

@test "Verify that autofs is not installed" {
  run packageInstalled 'autofs'
  [ "$status" -eq 1 ]
}

@test "Verify that avahi is not installed" {
  run packageInstalled 'avahi'
  [ "$status" -eq 1 ]
}

@test "Verify that beep is not installed" {
  run packageInstalled 'beep'
  [ "$status" -eq 1 ]
}

@test "Verify that git is not installed" {
  run packageInstalled 'git'
  [ "$status" -eq 1 ]
}

@test "Verify that pastebinit is not installed" {
  run packageInstalled 'pastebinit'
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

@test "Verify that rsync is not installed" {
  run packageInstalled 'rsync'
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

@test "Verify that whoopsie is not installed" {
  run packageInstalled 'whoopsie'
  [ "$status" -eq 1 ]
}

@test "Verify that xinetd is not installed" {
  run packageInstalled 'xinetd'
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

@test "Verify that psad is installed" {
  run packageInstalled 'psad'
  [ "$status" -eq 0 ]
}
