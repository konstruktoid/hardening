#!/usr/bin/env bats

load test_helper

@test "Verify that a NTP server is set in $TIMESYNCD" {
  run bash -c "grep '^NTP=...' $TIMESYNCD"
  [ "$status" -eq 0 ]
}

@test "Verify that a fallback NTP server is set in $TIMESYNCD" {
  run bash -c "grep '^FallbackNTP=...' $TIMESYNCD"
  [ "$status" -eq 0 ]
}

@test "Verify that RootDistanceMaxSec is set in $TIMESYNCD" {
  run bash -c "grep '^RootDistanceMaxSec=1$' $TIMESYNCD"
  [ "$status" -eq 0 ]
}
