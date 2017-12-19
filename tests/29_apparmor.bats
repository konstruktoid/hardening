#/usr/bin/env bats

load test_helper

@test "Verify pam_apparmor" {
  run bash -c "grep 'pam_apparmor.so order=user,group,default' /etc/pam.d/*"
  [ "$status" -eq 0 ]
}
