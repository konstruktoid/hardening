#/usr/bin/env bats

load test_helper

@test "Verify that AppArmor is enabled on the kernel command line" {
  run bash -c "grep 'apparmor=1' /proc/cmdline"
  [ "$status" -eq 0 ]
}

@test "Verify that AppArmor is enabled" {
  run bash -c "apparmor_status | grep 'apparmor module is loaded'"
  [ "$status" -eq 0 ]
}

@test "Verify pam_apparmor" {
  run bash -c "grep 'session.*pam_apparmor.so order=user,group,default' /etc/pam.d/*"
  [ "$status" -eq 0 ]
}
