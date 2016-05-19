#!/usr/bin/env bats

load test_helper

@test "Verify that kernel module cramfs is disabled" {
  run bash -c "grep 'install cramfs /bin/true' $DISABLEMNT"
  [ "$status" -eq 0 ]
}

@test "Verify that kernel module freevxfs is disabled" {
  run bash -c "grep 'install freevxfs /bin/true' $DISABLEMNT"
  [ "$status" -eq 0 ]
}

@test "Verify that kernel module jffs2 is disabled" {
  run bash -c "grep 'install jffs2 /bin/true' $DISABLEMNT"
  [ "$status" -eq 0 ]
}

@test "Verify that kernel module hfs is disabled" {
  run bash -c "grep 'install hfs /bin/true' $DISABLEMNT"
  [ "$status" -eq 0 ]
}

@test "Verify that kernel module hfsplus is disabled" {
  run bash -c "grep 'install hfsplus /bin/true' $DISABLEMNT"
  [ "$status" -eq 0 ]
}

@test "Verify that kernel module squashfs is disabled" {
  run bash -c "grep 'install squashfs /bin/true' $DISABLEMNT"
  [ "$status" -eq 0 ]
}

@test "Verify that kernel module udf is disabled" {
  run bash -c "grep 'install udf /bin/true' $DISABLEMNT"
  [ "$status" -eq 0 ]
}

@test "Verify that kernel module vfat is disabled" {
  run bash -c "grep 'install udf /bin/true' $DISABLEMNT"
  [ "$status" -eq 0 ]
}
