#!/usr/bin/env bats

load test_helper

@test "Verify minlen in /etc/security/pwquality.conf" {
  run bash -c "grep '^minlen = 15$' /etc/security/pwquality.conf"
  [ "$status" -eq 0 ]
}

@test "Verify minclass in /etc/security/pwquality.conf" {
  run bash -c "grep '^minclass = 3$' /etc/security/pwquality.conf"
  [ "$status" -eq 0 ]
}

@test "Verify maxrepeat in /etc/security/pwquality.conf" {
  run bash -c "grep '^maxrepeat = 3$' /etc/security/pwquality.conf"
  [ "$status" -eq 0 ]
}

@test "Verify password hash in $COMMONPASSWD" {
  run bash -c "grep '^password.*pam_unix.*[[:space:]]sha512' $COMMONPASSWD"
  [ "$status" -eq 0 ]
}

@test "Verify password rounds in $COMMONPASSWD" {
  run bash -c "grep '^password.*pam_unix.*[[:space:]]sha512[[:space:]]rounds=65536$' $COMMONPASSWD"
  [ "$status" -eq 0 ]
}

@test "Verify remember in $COMMONPASSWD" {
  run bash -c "grep '^password.*required.*pam_pwhistory.so.*[[:space:]]remember=5$' $COMMONPASSWD"
  [ "$status" -eq 0 ]
}

@test "Verify retry in $COMMONPASSWD" {
  run bash -c "grep '^password.*requisite.*pam_pwquality.so.*[[:space:]]retry=3$' $COMMONPASSWD"
  [ "$status" -eq 0 ]
}

@test "Ensure nullok is not used in $COMMONAUTH" {
  run bash -c "grep 'nullok' $COMMONAUTH"
  [ "$status" -eq 1 ]
}

@test "Verify pam_tally2 is used in $COMMONAUTH" {
  run bash -c "grep '^auth required pam_tally2' $COMMONAUTH"
  [ "$status" -eq 0 ]
}

@test "Verify pam_tally2 denies after 5 tries in $COMMONAUTH" {
  run bash -c "grep '^auth required pam_tally2.*[[:space:]]deny=5' $COMMONAUTH"
  [ "$status" -eq 0 ]
}

@test "Verify that failed logins are shown in $PAMLOGIN" {
  run bash -c "grep '^session.*pam_lastlog.*showfailed' $PAMLOGIN"
  [ "$status" -eq 0 ]
}

@test "Verify that failed logins are delayed in $PAMLOGIN" {
  run bash -c "grep '^auth.*pam_faildelay.*delay=4000000' $PAMLOGIN"
  [ "$status" -eq 0 ]
}
