#!/usr/bin/env bats

load test_helper

@test "Verify that kernel module dccp is disabled" {
  run bash -c "grep 'install dccp /bin/true' $DISABLENET"
  [ "$status" -eq 0 ]
}

@test "Verify that kernel module sctp is disabled" {
  run bash -c "grep 'install sctp /bin/true' $DISABLENET"
  [ "$status" -eq 0 ]
}

@test "Verify that kernel module rds is disabled" {
  run bash -c "grep 'install rds /bin/true' $DISABLENET"
  [ "$status" -eq 0 ]
}

@test "Verify that kernel module tipc is disabled" {
  run bash -c "grep 'install tipc /bin/true' $DISABLENET"
  [ "$status" -eq 0 ]
}
