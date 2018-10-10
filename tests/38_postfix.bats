#!/usr/bin/env bats

load test_helper

@test "Verify postfix smtpd_banner" {
  run bash -c "postconf | grep '^smtpd_banner = \$myhostname ESMTP$'"
  [ "$status" -eq 0 ]
}

@test "Verify that postfix disable_vrfy_command is set" {
  run bash -c "postconf | grep '^disable_vrfy_command = yes$'"
  [ "$status" -eq 0 ]
}

@test "Verify that postfix smtpd_client_restrictions is set" {
  run bash -c "postconf | grep '^smtpd_client_restrictions = permit_mynetworks,reject$'"
  [ "$status" -eq 0 ]
}
