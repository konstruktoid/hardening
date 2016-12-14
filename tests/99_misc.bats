#/usr/bin/env bats

load test_helper

@test "Verify password protected GRUB" {
  run bash -c "grep '^password_pbkdf2.*grub\.pbkdf2\.sha512\.' /boot/grub/grub.cfg"
  [ "$status" -eq 0 ]
}

@test "Verify Google 2FA in /etc/pam.d/sshd " {
  run bash -c "grep '^auth required pam_google_authenticator.so.*$' /etc/pam.d/sshd"
  [ "$status" -eq 0 ]
}
