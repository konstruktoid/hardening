#!/usr/bin/env bats

@test "Verify usbguard is enabled" {
  run bash -c "systemctl is-enabled usbguard.service"
  [ "$status" -eq 0 ]
}
