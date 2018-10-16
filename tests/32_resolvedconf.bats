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

@test "Verify that DNSOverTLS is used in $RESOLVEDCONF" {
  run bash -c "grep '^DNSOverTLS=opportunistic$' $RESOLVEDCONF"
  [ "$status" -eq 0 ]
}

@test "Verify that nss-resolve is present in /etc/nsswitch.conf" {
  run bash -c "grep '^hosts:.*files.*resolve' /etc/nsswitch.conf"
  [ "$status" -eq 0 ]
}
