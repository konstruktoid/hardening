#!/usr/bin/env bats

load test_helper

@test "Verify that kernel module cramfs is disabled in $DISABLEMNT" {
  run bash -c "grep 'install cramfs /bin/true' $DISABLEMNT"
  [ "$status" -eq 0 ]
}

@test "Verify that kernel module freevxfs is disabled in $DISABLEMNT" {
  run bash -c "grep 'install freevxfs /bin/true' $DISABLEMNT"
  [ "$status" -eq 0 ]
}

@test "Verify that kernel module jffs2 is disabled in $DISABLEMNT" {
  run bash -c "grep 'install jffs2 /bin/true' $DISABLEMNT"
  [ "$status" -eq 0 ]
}

@test "Verify that kernel module hfs is disabled in $DISABLEMNT" {
  run bash -c "grep 'install hfs /bin/true' $DISABLEMNT"
  [ "$status" -eq 0 ]
}

@test "Verify that kernel module hfsplus is disabled in $DISABLEMNT" {
  run bash -c "grep 'install hfsplus /bin/true' $DISABLEMNT"
  [ "$status" -eq 0 ]
}

@test "Verify that kernel module squashfs is disabled in $DISABLEMNT" {
  run bash -c "grep 'install squashfs /bin/true' $DISABLEMNT"
  [ "$status" -eq 0 ]
}

@test "Verify that kernel module udf is disabled in $DISABLEMNT" {
  run bash -c "grep 'install udf /bin/true' $DISABLEMNT"
  [ "$status" -eq 0 ]
}

@test "Verify that kernel module vfat is disabled in $DISABLEMNT" {
  run bash -c "grep 'install vfat /bin/true' $DISABLEMNT"
  [ "$status" -eq 0 ]
}

@test "Verify that runtime kernel module cramfs is disabled" {
  run bash -c "modprobe -n -v cramfs | grep 'install /bin/true'"
  [ "$status" -eq 0 ]
}

@test "Verify that runtime kernel module freevxfs is disabled" {
  run bash -c "modprobe -n -v freevxfs | grep 'install /bin/true'"
  [ "$status" -eq 0 ]
}

@test "Verify that runtime kernel module jffs2 is disabled" {
  run bash -c "modprobe -n -v jffs2 | grep 'install /bin/true'"
  [ "$status" -eq 0 ]
}

@test "Verify that runtime kernel module hfs is disabled" {
  run bash -c "modprobe -n -v hfs | grep 'install /bin/true'"
  [ "$status" -eq 0 ]
}

@test "Verify that runtime kernel module hfsplus is disabled" {
  run bash -c "modprobe -n -v hfsplus | grep 'install /bin/true'"
  [ "$status" -eq 0 ]
}

@test "Verify that runtime kernel module squashfs is disabled" {
  run bash -c "modprobe -n -v squashfs | grep 'install /bin/true'"
  [ "$status" -eq 0 ]
}

@test "Verify that runtime kernel module udf is disabled" {
  run bash -c "modprobe -n -v udf | grep 'install /bin/true'"
  [ "$status" -eq 0 ]
}

@test "Verify that runtime kernel module vfat is disabled" {
  run bash -c "modprobe -n -v vfat | grep 'install /bin/true'"
  [ "$status" -eq 0 ]
}
