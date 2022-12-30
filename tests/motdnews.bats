#!/usr/bin/env bats

load test_helper

@test "Verify that motd_news is disabled in /etc/default/motd-news" {
  run bash -c "grep '^ENABLED=0$' /etc/default/motd-news"
  [ "$status" -eq 0 ]
}

@test "Verify that APT news is disabled" {
  run bash -c "pro config show | grep '^apt_news.*False'"
  [ "$status" -eq 0 ]
}
