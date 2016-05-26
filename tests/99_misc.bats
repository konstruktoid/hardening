#/usr/bin/env bats

load test_helper

@test "Verify password protected GRUB" {
  run bash -c "grep '^password_pbkdf2.*grub\.pbkdf2\.sha512\.' /boot/grub/grub.cfg"
  [ "$status" -eq 0 ]
}
