#!/usr/bin/env bats

load test_helper

@test "Verify password minimum length in $COMMONPASSWD" {
  run bash -c "grep '^password.*required.*pam_cracklib.*[[:space:]]minlen=15' $COMMONPASSWD"
  [ "$status" -eq 0 ]
}

@test "Verify password hash in $COMMONPASSWD" {
  run bash -c "grep '^password.*pam_unix.*[[:space:]]sha512' $COMMONPASSWD"
  [ "$status" -eq 0 ]
}

@test "Verify remember in $COMMONPASSWD" {
  run bash -c "grep '^password.*pam_unix.*[[:space:]]remember=24' $COMMONPASSWD"
  [ "$status" -eq 0 ]
}

@test "Ensure nullok isn't used in $COMMONAUTH" {
  run bash -c "grep 'nullok' $COMMONAUTH"
  [ "$status" -eq 1 ]
}

@test "Verify pam_tally is used in $COMMONAUTH" {
  run bash -c "grep '^auth required pam_tally' $COMMONAUTH"
  [ "$status" -eq 0 ]
}

@test "Verify pam_tally denies after 5 tries in $COMMONAUTH" {
  run bash -c "grep '^auth required pam_tally.*[[:space:]]deny=5' $COMMONAUTH"
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
