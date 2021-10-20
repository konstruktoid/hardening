#!/usr/bin/env bats

load test_helper

@test "Verify that kernel module dccp is disabled" {
  run bash -c "modprobe -n -v dccp | grep 'install /bin/true'"
  [ "$status" -eq 0 ]
}

@test "Verify that kernel module rds is disabled" {
  run bash -c "modprobe -n -v rds | grep 'install /bin/true'"
  [ "$status" -eq 0 ]
}

@test "Verify that kernel module sctp is disabled" {
  run bash -c "modprobe -n -v sctp | grep 'install /bin/true'"
  [ "$status" -eq 0 ]
}

@test "Verify that kernel module tipc is disabled" {
  run bash -c "modprobe -n -v tipc | grep 'install /bin/true'"
  [ "$status" -eq 0 ]
}
