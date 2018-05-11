#!/usr/bin/env bats

load test_helper

@test "Verify DumpCore in $SYSTEMCONF" {
  run bash -c "grep '^DumpCore=no$' $SYSTEMCONF"
  [ "$status" -eq 0 ]
}

@test "Verify CrashShell in $SYSTEMCONF" {
  run bash -c "grep '^CrashShell=no$' $SYSTEMCONF"
  [ "$status" -eq 0 ]
}

@test "Verify system DefaultLimitCORE in $SYSTEMCONF" {
  run bash -c "grep '^DefaultLimitCORE=0$' $SYSTEMCONF"
  [ "$status" -eq 0 ]
}

@test "Verify system DefaultLimitNOFILE in $SYSTEMCONF" {
  run bash -c "grep '^DefaultLimitNOFILE=1024$' $SYSTEMCONF"
  [ "$status" -eq 0 ]
}

@test "Verify system DefaultLimitNPROC in $SYSTEMCONF" {
  run bash -c "grep '^DefaultLimitNPROC=1024$' $SYSTEMCONF"
  [ "$status" -eq 0 ]
}

@test "Verify user DefaultLimitCORE in $USERCONF" {
  run bash -c "grep '^DefaultLimitCORE=0$' $USERCONF"
  [ "$status" -eq 0 ]
}

@test "Verify user DefaultLimitNOFILE in $USERCONF" {
  run bash -c "grep '^DefaultLimitNOFILE=1024$' $USERCONF"
  [ "$status" -eq 0 ]
}

@test "Verify user DefaultLimitNPROC in $USERCONF" {
  run bash -c "grep '^DefaultLimitNPROC=1024$' $USERCONF"
  [ "$status" -eq 0 ]
}
