#!/usr/bin/env bats

load test_helper

@test "Verify that kernel module bluetooth is disabled" {
  run bash -c "modprobe -n -v bluetooth | grep 'install /bin/true'"
  [ "$status" -eq 0 ]
}

@test "Verify that kernel module bnep is disabled" {
  run bash -c "modprobe -n -v bnep | grep 'install /bin/true'"
  [ "$status" -eq 0 ]
}

@test "Verify that kernel module btusb is disabled" {
  run bash -c "modprobe -n -v btusb | grep 'install /bin/true'"
  [ "$status" -eq 0 ]
}

@test "Verify that kernel module cpia2 is disabled" {
  run bash -c "modprobe -n -v cpia2 | grep 'install /bin/true'"
  [ "$status" -eq 0 ]
}

@test "Verify that kernel module firewire-core is disabled" {
  run bash -c "modprobe -n -v firewire-core | grep 'install /bin/true'"
  [ "$status" -eq 0 ]
}

@test "Verify that kernel module floppy is disabled" {
  run bash -c "modprobe -n -v floppy | grep 'install /bin/true'"
  [ "$status" -eq 0 ]
}

@test "Verify that kernel module n_hdlc is disabled" {
  run bash -c "modprobe -n -v n_hdlc | grep 'install /bin/true'"
  [ "$status" -eq 0 ]
}

@test "Verify that kernel module net-pf-31 is disabled" {
  run bash -c "modprobe -n -v net-pf-31 | grep 'install /bin/true'"
  [ "$status" -eq 0 ]
}

@test "Verify that kernel module pcspkr is disabled" {
  run bash -c "modprobe -n -v pcspkr | grep 'install /bin/true'"
  [ "$status" -eq 0 ]
}

@test "Verify that kernel module soundcore is disabled" {
  run bash -c "modprobe -n -v soundcore | grep 'install /bin/true'"
  [ "$status" -eq 0 ]
}

@test "Verify that kernel module thunderbolt is disabled" {
  run bash -c "modprobe -n -v thunderbolt | grep 'install /bin/true'"
  [ "$status" -eq 0 ]
}

@test "Verify that kernel module usb-midi is disabled" {
  run bash -c "modprobe -n -v usb-midi | grep 'install /bin/true'"
  [ "$status" -eq 0 ]
}

@test "Verify that kernel module usb-storage is disabled" {
  run bash -c "modprobe -n -v usb-storage | grep 'install /bin/true'"
  [ "$status" -eq 0 ]
}

@test "Verify that kernel module uvcvideo is disabled" {
  run bash -c "modprobe -n -v uvcvideo | grep 'install /bin/true'"
  [ "$status" -eq 0 ]
}

@test "Verify that kernel module v4l2_common is disabled" {
  run bash -c "modprobe -n -v v4l2_common | grep 'install /bin/true'"
  [ "$status" -eq 0 ]
}
