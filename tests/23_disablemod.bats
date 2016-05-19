#!/usr/bin/env bats

load test_helper

@test "Verify that kernel module bluetooth is disabled" {
  run bash -c "grep 'install bluetooth /bin/true' $DISABLEMOD"
  [ "$status" -eq 0 ]
}

@test "Verify that kernel module firewire-core is disabled" {
  run bash -c "grep 'install firewire-core /bin/true' $DISABLEMOD"
  [ "$status" -eq 0 ]
}

@test "Verify that kernel module net-pf-31 is disabled" {
  run bash -c "grep 'install net-pf-31 /bin/true' $DISABLEMOD"
  [ "$status" -eq 0 ]
}

@test "Verify that kernel module soundcore is disabled" {
  run bash -c "grep 'install soundcore /bin/true' $DISABLEMOD"
  [ "$status" -eq 0 ]
}

@test "Verify that kernel module thunderbolt is disabled" {
  run bash -c "grep 'install thunderbolt /bin/true' $DISABLEMOD"
  [ "$status" -eq 0 ]
}

@test "Verify that kernel module usb-midi is disabled" {
  run bash -c "grep 'install usb-midi /bin/true' $DISABLEMOD"
  [ "$status" -eq 0 ]
}

@test "Verify that kernel module usb-storage is disabled" {
  run bash -c "grep 'install usb-storage /bin/true' $DISABLEMOD"
  [ "$status" -eq 0 ]
}
