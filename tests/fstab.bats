#!/usr/bin/env bats

load test_helper

@test "Ensure a floppy is not present in /etc/fstab" {
  run bash -c "grep floppy /etc/fstab"
  [ "$status" -eq 1 ]
}

@test "Ensure a floppy is not mounted" {
  run bash -c "grep floppy /proc/mounts"
  [ "$status" -eq 1 ]
}

@test "Ensure /tmp is not present in /etc/fstab" {
  run bash -c "grep -e '[[:space:]]/tmp[[:space:]]' /etc/fstab"
  [ "$status" -eq 1 ]
}

@test "Verify that tmp.mount is enabled" {
  run bash -c "systemctl is-enabled tmp.mount"
  [ "$status" -eq 0 ]
}

@test "Verify /tmp nodev option" {
  tmpMount=$(fragmentPath tmp.mount)
  run bash -c "grep '^Options=.*nodev.*' $tmpMount"
  [ "$status" -eq 0 ]
}

@test "Verify /tmp nosuid option" {
  tmpMount=$(fragmentPath tmp.mount)
  run bash -c "grep '^Options=.*nosuid.*' $tmpMount"
  [ "$status" -eq 0 ]
}

@test "Verify /tmp noexec option" {
  tmpMount=$(fragmentPath tmp.mount)
  run bash -c "grep '^Options=.*noexec.*' $tmpMount"
  [ "$status" -eq 0 ]
}

@test "Verify /var/tmp nodev option" {
  varTmpMount=$(fragmentPath var-tmp.mount)
  run bash -c "grep '^Options=.*nodev.*' $varTmpMount"
  [ "$status" -eq 0 ]
}

@test "Verify /var/tmp nosuid option" {
  varTmpMount=$(fragmentPath var-tmp.mount)
  run bash -c "grep '^Options=.*nosuid.*' $varTmpMount"
  [ "$status" -eq 0 ]
}

@test "Verify /var/tmp noexec option" {
  varTmpMount=$(fragmentPath var-tmp.mount)
  run bash -c "grep '^Options=.*noexec.*' $varTmpMount"
  [ "$status" -eq 0 ]
}

@test "Verify that /var/tmp is mounted with nodev" {
  run bash -c "grep '[[:space:]]/var/tmp[[:space:]].*nodev.*' /proc/mounts"
  [ "$status" -eq 0 ]
}

@test "Verify that /var/tmp is mounted with nosuid" {
  run bash -c "grep '[[:space:]]/var/tmp[[:space:]].*nosuid.*' /proc/mounts"
  [ "$status" -eq 0 ]
}

@test "Verify that /var/tmp is mounted with noexec" {
  run bash -c "grep '[[:space:]]/var/tmp[[:space:]].*noexec.*' /proc/mounts"
  [ "$status" -eq 0 ]
}

@test "Verify that /tmp is mounted with nodev" {
  run bash -c "grep '[[:space:]]/tmp[[:space:]].*nodev.*' /proc/mounts"
  [ "$status" -eq 0 ]
}

@test "Verify that /tmp is mounted with nosuid" {
  run bash -c "grep '[[:space:]]/tmp[[:space:]].*nosuid.*' /proc/mounts"
  [ "$status" -eq 0 ]
}

@test "Verify that /tmp is mounted with noexec" {
  run bash -c "grep '[[:space:]]/tmp[[:space:]].*noexec.*' /proc/mounts"
  [ "$status" -eq 0 ]
}

@test "Verify that /boot is a separate partition" {
  run bash -c "grep '[[:space:]]/boot[[:space:]]' /proc/mounts"
  [ "$status" -eq 0 ]
}

@test "Verify that /boot is mounted with nodev" {
  run bash -c "grep '[[:space:]]/boot[[:space:]].*nodev.*' /proc/mounts"
  [ "$status" -eq 0 ]
}

@test "Verify that /boot is mounted with nosuid" {
  run bash -c "grep '[[:space:]]/boot[[:space:]].*nosuid.*' /proc/mounts"
  [ "$status" -eq 0 ]
}

@test "Verify that /home is a separate partition" {
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

@test "Verify that /var/log/audit is a separate partition" {
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

@test "Verify that /var/log is a separate partition" {
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

@test "Verify that /proc is mounted with nodev" {
  run bash -c "grep '[[:space:]]/proc[[:space:]].*nodev.*' /proc/mounts"
  [ "$status" -eq 0 ]
}

@test "Verify that /proc is mounted with nosuid" {
  run bash -c "grep '[[:space:]]/proc[[:space:]].*nosuid.*' /proc/mounts"
  [ "$status" -eq 0 ]
}

@test "Verify that /proc is mounted with noexec" {
  run bash -c "grep '[[:space:]]/proc[[:space:]].*noexec.*' /proc/mounts"
  [ "$status" -eq 0 ]
}

@test "Verify that /proc is mounted with hidepid" {
  run bash -c "grep '[[:space:]]/proc[[:space:]].*hidepid=.*' /proc/mounts"
  [ "$status" -eq 0 ]
}

@test "Verify that /dev/shm is mounted with nodev" {
  run bash -c "grep '[[:space:]]/dev/shm[[:space:]].*nodev.*' /proc/mounts"
  [ "$status" -eq 0 ]
}

@test "Verify that /dev/shm is mounted with nosuid" {
  run bash -c "grep '[[:space:]]/dev/shm[[:space:]].*nosuid.*' /proc/mounts"
  [ "$status" -eq 0 ]
}

@test "Verify that /dev/shm is mounted with noexec" {
  run bash -c "grep '[[:space:]]/dev/shm[[:space:]].*noexec.*' /proc/mounts"
  [ "$status" -eq 0 ]
}

@test "Verify that /run/shm is mounted with nodev" {
  run bash -c "grep '[[:space:]]/run/shm[[:space:]].*nodev.*' /proc/mounts"
  [ "$status" -eq 0 ]
}

@test "Verify that /run/shm is mounted with nosuid" {
  run bash -c "grep '[[:space:]]/run/shm[[:space:]].*nosuid.*' /proc/mounts"
  [ "$status" -eq 0 ]
}

@test "Verify that /run/shm is mounted with noexec" {
  run bash -c "grep '[[:space:]]/run/shm[[:space:]].*noexec.*' /proc/mounts"
  [ "$status" -eq 0 ]
}
