#/usr/bin/env bats

load test_helper

@test "Ensure that AppArmor is not disabled on the kernel command line" {
  run bash -c "grep -R 'apparmor=0' /boot/*"
  [ "$status" -eq 1 ]
}

@test "Verify that AppArmor is enabled" {
  run bash -c "apparmor_status | grep 'apparmor module is loaded'"
  [ "$status" -eq 0 ]
}

@test "Verify pam_apparmor" {
  run bash -c "grep 'session.*pam_apparmor.so order=user,group,default' /etc/pam.d/*"
  [ "$status" -eq 0 ]
}
