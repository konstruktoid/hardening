#!/usr/bin/env bats

load test_helper

@test "Verify that postfix disable_vrfy_command is set" {
  run bash -c "grep '^disable_vrfy_command = yes$' /etc/postfix/main.cf"
  [ "$status" -eq 0 ]
}
