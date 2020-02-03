#!/usr/bin/env bats

@test "Verify sudo use_pty" {
  run bash -c "grep -qER '^Defaults.*use_pty$' /etc/sudo*"
  [ "$status" -eq 0 ]
}

@test "Verify sudo custom logfile" {
  run bash -c "grep -qER '^Defaults.*logfile' /etc/sudo*"
  [ "$status" -eq 0 ]
}

@test "Verify sudo disabled pwfeedback" {
  run bash -c "grep -qER '^Defaults !pwfeedback$' /etc/sudo*"
  [ "$status" -eq 0 ]
}

@test "Verify sudo disabled visiblepw" {
  run bash -c "grep -qER '^Defaults !visiblepw$' /etc/sudo*"
  [ "$status" -eq 0 ]
}

@test "Verify sudo runtime use_pty" {
  run bash -c "sudo -l | grep 'use_pty'"
  [ "$status" -eq 0 ]
}

@test "Verify sudo runtime custom logfile" {
  run bash -c "sudo -l | grep 'logfile=/var/log/sudo.log'"
  [ "$status" -eq 0 ]
}

@test "Verify sudo runtime disabled pwfeedback" {
  run bash -c "sudo -l | grep '!pwfeedback'"
  [ "$status" -eq 0 ]
}

@test "Verify sudo runtime disabled visiblepw" {
  run bash -c "sudo -l | grep '!visiblepw'"
  [ "$status" -eq 0 ]
}
