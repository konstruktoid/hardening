#!/usr/bin/env bats

load test_helper

@test "Verify DumpCore=no in $SYSTEMCONF" {
  run bash -c "grep '^DumpCore=no$' $SYSTEMCONF"
  [ "$status" -eq 0 ]
}

@test "Verify CrashShell=no in $SYSTEMCONF" {
  run bash -c "grep '^CrashShell=no$' $SYSTEMCONF"
  [ "$status" -eq 0 ]
}

@test "Verify system DefaultLimitCORE=0 in $SYSTEMCONF" {
  run bash -c "grep '^DefaultLimitCORE=0$' $SYSTEMCONF"
  [ "$status" -eq 0 ]
}

@test "Verify system DefaultLimitNOFILE=100 in $SYSTEMCONF" {
  run bash -c "grep '^DefaultLimitNOFILE=100$' $SYSTEMCONF"
  [ "$status" -eq 0 ]
}

@test "Verify system DefaultLimitNPROC=100 in $SYSTEMCONF" {
  run bash -c "grep '^DefaultLimitNPROC=100$' $SYSTEMCONF"
  [ "$status" -eq 0 ]
}

@test "Verify user DefaultLimitCORE=0 in $USERCONF" {
  run bash -c "grep '^DefaultLimitCORE=0$' $USERCONF"
  [ "$status" -eq 0 ]
}

@test "Verify user DefaultLimitNOFILE=100 in $USERCONF" {
  run bash -c "grep '^DefaultLimitNOFILE=100$' $USERCONF"
  [ "$status" -eq 0 ]
}

@test "Verify user DefaultLimitNPROC=100 in $USERCONF" {
  run bash -c "grep '^DefaultLimitNPROC=100$' $USERCONF"
  [ "$status" -eq 0 ]
}
