#!/usr/bin/env bats

load test_helper

@test "Verify a DNS server is set in $RESOLVEDCONF" {
  run bash -c "grep '^DNS=...' $RESOLVEDCONF"
  [ "$status" -eq 0 ]
}

@test "Verify a FallbackDNS server is set in $RESOLVEDCONF" {
  run bash -c "grep '^FallbackDNS=...' $RESOLVEDCONF"
  [ "$status" -eq 0 ]
}

@test "Verify that DNSSEC is used in $RESOLVEDCONF" {
  run bash -c "grep '^DNSSEC=...' $RESOLVEDCONF"
  [ "$status" -eq 0 ]
}
