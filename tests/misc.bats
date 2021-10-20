#/usr/bin/env bats

load test_helper

@test "Verify that fwupd is installed" {
  run packageInstalled 'fwupd'
  [ "$status" -eq 0 ]
}

@test "Verify that secureboot-db is installed" {
  run packageInstalled 'secureboot-db'
  [ "$status" -eq 0 ]
}

@test "Verify NX support is enabled" {
  run bash -c "grep -Ei 'processor|\snx\s' /proc/cpuinfo"
  [ "$status" -eq 0 ]
}

@test "Verify password protected GRUB" {
  run bash -c "grep '^password_pbkdf2.*grub\.pbkdf2\.sha512\.' /boot/grub/grub.cfg"
  [ "$status" -eq 0 ]
}

@test "Verify Google 2FA in /etc/pam.d/sshd" {
  run bash -c "grep '^auth required pam_google_authenticator.so.*$' /etc/pam.d/sshd"
  [ "$status" -eq 0 ]
}

@test "Verify Yubico 2FA in /etc/pam.d/sshd" {
  run bash -c "grep '^auth required pam_yubico.so.*$' /etc/pam.d/sshd"
  [ "$status" -eq 0 ]
}

@test "Verify OpenSSH certificate use" {
  run sshdConfig '^HostCertificate.*-cert.pub$'
  [ "$status" -eq 0 ]
}
