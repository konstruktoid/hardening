#!/usr/bin/env bats

load test_helper

@test "Verify that journald storage is persistent in $JOURNALDCONF" {
  run bash -c "grep '^Storage=persistent$' $JOURNALDCONF"
  [ "$status" -eq 0 ]
}

@test "Verify that journald forwards to syslog in $JOURNALDCONF" {
  run bash -c "grep '^ForwardToSyslog=yes$' $JOURNALDCONF"
  [ "$status" -eq 0 ]
}

@test "Verify that journald compresses logs in $JOURNALDCONF" {
  run bash -c "grep '^Compress=yes$' $JOURNALDCONF"
  [ "$status" -eq 0 ]
}

@test "Verify that logrotate compresses logs in $LOGROTATE" {
  run bash -c "grep '^compress$' $LOGROTATE"
  [ "$status" -eq 0 ]
}

@test "Verify FileCreateMode in $RSYSLOGCONF" {
  run bash -c "grep '^\$FileCreateMode 0600$' $RSYSLOGCONF"
  [ "$status" -eq 0 ]
}
