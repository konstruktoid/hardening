#!/usr/bin/env bats

load test_helper

@test "Ensure /bin/fusermount hasn't SUID/GUID set" {
  run gotSGid /bin/fusermount
  [ "$status" -eq 1 ]
}

@test "Ensure /bin/mount hasn't SUID/GUID set" {
  run gotSGid /bin/mount
  [ "$status" -eq 1 ]
}

@test "Ensure /bin/ping hasn't SUID/GUID set" {
  run gotSGid /bin/ping
  [ "$status" -eq 1 ]
}

@test "Ensure /bin/ping6 hasn't SUID/GUID set" {
  run gotSGid /bin/ping6
  [ "$status" -eq 1 ]
}

@test "Ensure /bin/su hasn't SUID/GUID set" {
  run gotSGid /bin/su
  [ "$status" -eq 1 ]
}

@test "Ensure /bin/umount hasn't SUID/GUID set" {
  run gotSGid /bin/umount
  [ "$status" -eq 1 ]
}

@test "Ensure /usr/bin/bsd-write hasn't SUID/GUID set" {
  run gotSGid /usr/bin/bsd-write
  [ "$status" -eq 1 ]
}

@test "Ensure /usr/bin/chage hasn't SUID/GUID set" {
  run gotSGid /usr/bin/chage
  [ "$status" -eq 1 ]
}

@test "Ensure /usr/bin/chfn hasn't SUID/GUID set" {
  run gotSGid /usr/bin/chfn
  [ "$status" -eq 1 ]
}

@test "Ensure /usr/bin/chsh hasn't SUID/GUID set" {
  run gotSGid /usr/bin/chsh
  [ "$status" -eq 1 ]
}

@test "Ensure /usr/bin/mlocate hasn't SUID/GUID set" {
  run gotSGid /usr/bin/mlocate
  [ "$status" -eq 1 ]
}

@test "Ensure /usr/bin/mtr hasn't SUID/GUID set" {
  run gotSGid /usr/bin/mtr
  [ "$status" -eq 1 ]
}

@test "Ensure /usr/bin/newgrp hasn't SUID/GUID set" {
  run gotSGid /usr/bin/newgrp
  [ "$status" -eq 1 ]
}

@test "Ensure /usr/bin/pkexec hasn't SUID/GUID set" {
  run gotSGid /usr/bin/pkexec
  [ "$status" -eq 1 ]
}

@test "Ensure /usr/bin/traceroute6.iputils hasn't SUID/GUID set" {
  run gotSGid /usr/bin/traceroute6.iputils
  [ "$status" -eq 1 ]
}

@test "Ensure /usr/bin/wall hasn't SUID/GUID set" {
  run gotSGid /usr/bin/wall
  [ "$status" -eq 1 ]
}

@test "Ensure /usr/sbin/pppd hasn't SUID/GUID set" {
  run gotSGid /usr/sbin/pppd
  [ "$status" -eq 1 ]
}
