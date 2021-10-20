#!/usr/bin/env bats

load test_helper

@test "Verify KillUserProcesses in $LOGINDCONF" {
  run bash -c "grep '^KillUserProcesses=1$' $LOGINDCONF"
  [ "$status" -eq 0 ]
}

@test "Verify KillExcludeUsers in $LOGINDCONF" {
  run bash -c "grep '^KillExcludeUsers=root$' $LOGINDCONF"
  [ "$status" -eq 0 ]
}

@test "Verify IdleAction in $LOGINDCONF" {
  run bash -c "grep '^IdleAction=lock$' $LOGINDCONF"
  [ "$status" -eq 0 ]
}

@test "Verify IdleActionSec in $LOGINDCONF" {
  run bash -c "grep '^IdleActionSec=15min$' $LOGINDCONF"
  [ "$status" -eq 0 ]
}

@test "Verify RemoveIPC in $LOGINDCONF" {
  run bash -c "grep '^RemoveIPC=yes$' $LOGINDCONF"
  [ "$status" -eq 0 ]
}
