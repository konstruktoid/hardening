#!/usr/bin/env bats

load test_helper

@test "Verify DIR_MODE in $ADDUSER" {
  run bash -c "grep '^DIR_MODE=0750$' $ADDUSER"
  [ "$status" -eq 0 ]
}

@test "Verify DSHELL in $ADDUSER" {
  run bash -c "grep '^DSHELL=/bin/false$' $ADDUSER"
  [ "$status" -eq 0 ]
}

@test "Verify USERGROUPS in $ADDUSER" {
  run bash -c "grep '^USERGROUPS=yes$' $ADDUSER"
  [ "$status" -eq 0 ]
}

@test "Verify SHELL in $USERADD" {
  run bash -c "grep '^SHELL=/bin/false$' $USERADD"
  [ "$status" -eq 0 ]
}

@test "Verify INACTIVE in $USERADD" {
  run bash -c "grep '^INACTIVE=30$' $USERADD"
  [ "$status" -eq 0 ]
}

