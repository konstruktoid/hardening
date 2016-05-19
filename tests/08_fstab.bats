#!/usr/bin/env bats

load test_helper

@test "Ensure a floppy isn't present in /etc/fstab" {
  run bash -c "grep floppy /etc/fstab"
  [ "$status" -eq 1 ]
}

@test "Ensure /tmp isn't present in /etc/fstab" {
  run bash -c "grep -e '[[:space:]]/tmp[[:space:]]' /etc/fstab"
  [ "$status" -eq 1 ]
}

@test "Ensure /var/tmp isn't present in /etc/fstab" {
  run bash -c "grep -e '[[:space:]]/var/tmp[[:space:]]' /etc/fstab"
  [ "$status" -eq 1 ]
}

@test "Verify that tmp.mount is enabled" {
  run bash -c "systemctl is-enabled tmp.mount"
  [ "$status" -eq 0 ]
}

@test "Verify that var-tmp.mount is enabled" {
  run bash -c "systemctl is-enabled var-tmp.mount"
  [ "$status" -eq 0 ]
}

@test "Verify that /tmp is mounted with nodev" {
  tmpMount=$(fragmentPath tmp.mount)
  run bash -c "grep '^Options=.*nodev.*' $tmpMount"
  [ "$status" -eq 0 ]
}

@test "Verify that /tmp is mounted with nosuid" {
  tmpMount=$(fragmentPath tmp.mount)
  run bash -c "grep '^Options=.*nosuid.*' $tmpMount"
  [ "$status" -eq 0 ]
}

@test "Verify that /var/tmp is mounted with nodev" {
  varTmpMount=$(fragmentPath var-tmp.mount)
  run bash -c "grep '^Options=.*nodev.*' $varTmpMount"
  [ "$status" -eq 0 ]
}

@test "Verify that /var/tmp is mounted with nosuid" {
  varTmpMount=$(fragmentPath var-tmp.mount)
  run bash -c "grep '^Options=.*nosuid.*' $varTmpMount"
  [ "$status" -eq 0 ]
}

@test "Verify that /home is a seperate partition" {
  run bash -c "grep '[[:space:]]/home[[:space:]]' /proc/mounts"
  [ "$status" -eq 0 ]
}

@test "Verify that /home is mounted with nodev" {
  run bash -c "grep '[[:space:]]/home[[:space:]].*nodev.*' /proc/mounts"
  [ "$status" -eq 0 ]
}

@test "Verify that /home is mounted with nosuid" {
  run bash -c "grep '[[:space:]]/home[[:space:]].*nosuid.*' /proc/mounts"
  [ "$status" -eq 0 ]
}

@test "Verify that /var/log/audit is a seperate partition" {
  run bash -c "grep '[[:space:]]/var/log/audit[[:space:]]' /proc/mounts"
  [ "$status" -eq 0 ]
}

@test "Verify that /var/log/audit is mounted with nodev" {
  run bash -c "grep '[[:space:]]/var/log/audit[[:space:]].*nodev.*' /proc/mounts"
  [ "$status" -eq 0 ]
}

@test "Verify that /var/log/audit is mounted with nosuid" {
  run bash -c "grep '[[:space:]]/var/log/audit[[:space:]].*nosuid.*' /proc/mounts"
  [ "$status" -eq 0 ]
}

@test "Verify that /var/log/audit is mounted with noexec" {
  run bash -c "grep '[[:space:]]/var/log/audit[[:space:]].*noexec.*' /proc/mounts"
  [ "$status" -eq 0 ]
}

@test "Verify that /var/log is a seperate partition" {
  run bash -c "grep '[[:space:]]/var/log[[:space:]]' /proc/mounts"
  [ "$status" -eq 0 ]
}

@test "Verify that /var/log is mounted with nodev" {
  run bash -c "grep '[[:space:]]/var/log[[:space:]].*nodev.*' /proc/mounts"
  [ "$status" -eq 0 ]
}

@test "Verify that /var/log is mounted with nosuid" {
  run bash -c "grep '[[:space:]]/var/log[[:space:]].*nosuid.*' /proc/mounts"
  [ "$status" -eq 0 ]
}

@test "Verify that /var/log is mounted with noexec" {
  run bash -c "grep '[[:space:]]/var/log[[:space:]].*noexec.*' /proc/mounts"
  [ "$status" -eq 0 ]
}
