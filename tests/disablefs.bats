#!/usr/bin/env bats

load test_helper

@test "Verify that kernel module cramfs is disabled" {
  run bash -c "modprobe -n -v cramfs | grep 'install /bin/true'"
  [ "$status" -eq 0 ]
}

@test "Verify that kernel module freevxfs is disabled" {
  run bash -c "modprobe -n -v freevxfs | grep 'install /bin/true'"
  [ "$status" -eq 0 ]
}

@test "Verify that kernel module hfs is disabled" {
  run bash -c "modprobe -n -v hfs | grep 'install /bin/true'"
  [ "$status" -eq 0 ]
}

@test "Verify that kernel module hfsplus is disabled" {
  run bash -c "modprobe -n -v hfsplus | grep 'install /bin/true'"
  [ "$status" -eq 0 ]
}

@test "Verify that kernel module ksmbd is disabled" {
  run bash -c "modprobe -n -v ksmbd | grep 'install /bin/true'"
  [ "$status" -eq 0 ]
}

@test "Verify that kernel module jffs2 is disabled" {
  run bash -c "modprobe -n -v jffs2 | grep 'install /bin/true'"
  [ "$status" -eq 0 ]
}

@test "Verify that kernel module udf is disabled" {
  run bash -c "modprobe -n -v udf | grep 'install /bin/true'"
  [ "$status" -eq 0 ]
}
