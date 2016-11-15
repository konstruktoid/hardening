#!/usr/bin/env bats

load test_helper

@test "Verify that audit is enabled" {
  run bash -c "grep '^GRUB_CMDLINE_LINUX=\".*audit=1.*\"' $DEFAULTGRUB"
  [ "$status" -eq 0 ]
}

@test "Verify auditd is enabled" {
  run systemctl is-enabled auditd.service
  [ "$status" -eq 0 ]
}

@test "Verify /etc/audit/ in $AUDITRULES" {
  run bash -c "grep '^-w /etc/audit/ -p wa' $AUDITRULES"
  [ "$status" -eq 0 ]
}

@test "Verify /etc/libaudit.conf in $AUDITRULES" {
  run bash -c "grep '^-w /etc/libaudit.conf -p wa' $AUDITRULES"
  [ "$status" -eq 0 ]
}

@test "Verify /etc/audisp/ in $AUDITRULES" {
  run bash -c "grep '^-w /etc/audisp/ -p wa' $AUDITRULES"
  [ "$status" -eq 0 ]
}

@test "Verify /sbin/auditctl in $AUDITRULES" {
  run bash -c "grep '^-w /sbin/auditctl -p x' $AUDITRULES"
  [ "$status" -eq 0 ]
}

@test "Verify /sbin/auditd in $AUDITRULES" {
  run bash -c "grep '^-w /sbin/auditd -p x' $AUDITRULES"
  [ "$status" -eq 0 ]
}

@test "Verify /etc/apparmor/ in $AUDITRULES" {
  run bash -c "grep '^-w /etc/apparmor/ -p wa' $AUDITRULES"
  [ "$status" -eq 0 ]
}

@test "Verify /etc/apparmor.d/ in $AUDITRULES" {
  run bash -c "grep '^-w /etc/apparmor.d/ -p wa' $AUDITRULES"
  [ "$status" -eq 0 ]
}

@test "Verify /sbin/apparmor_parser in $AUDITRULES" {
  run bash -c "grep '^-w /sbin/apparmor_parser -p x' $AUDITRULES"
  [ "$status" -eq 0 ]
}

@test "Verify /usr/sbin/aa-complain in $AUDITRULES" {
  run bash -c "grep '^-w /usr/sbin/aa-complain -p x' $AUDITRULES"
  [ "$status" -eq 0 ]
}

@test "Verify /usr/sbin/aa-disable in $AUDITRULES" {
  run bash -c "grep '^-w /usr/sbin/aa-disable -p x' $AUDITRULES"
  [ "$status" -eq 0 ]
}

@test "Verify /usr/sbin/aa-enforce in $AUDITRULES" {
  run bash -c "grep '^-w /usr/sbin/aa-enforce -p x' $AUDITRULES"
  [ "$status" -eq 0 ]
}

@test "Verify /etc/systemd/ in $AUDITRULES" {
  run bash -c "grep '^-w /etc/systemd/ -p wa' $AUDITRULES"
  [ "$status" -eq 0 ]
}

@test "Verify /bin/systemctl in $AUDITRULES" {
  run bash -c "grep '^-w /bin/systemctl -p x' $AUDITRULES"
  [ "$status" -eq 0 ]
}

@test "Verify /bin/journalctl in $AUDITRULES" {
  run bash -c "grep '^-w /bin/journalctl -p x' $AUDITRULES"
  [ "$status" -eq 0 ]
}

@test "Verify /etc/cron.allow in $AUDITRULES" {
  run bash -c "grep '^-w /etc/cron.allow -p wa' $AUDITRULES"
  [ "$status" -eq 0 ]
}

@test "Verify /etc/cron.deny in $AUDITRULES" {
  run bash -c "grep '^-w /etc/cron.deny -p wa' $AUDITRULES"
  [ "$status" -eq 0 ]
}

@test "Verify /etc/cron.d/ in $AUDITRULES" {
  run bash -c "grep '^-w /etc/cron.d/ -p wa' $AUDITRULES"
  [ "$status" -eq 0 ]
}

@test "Verify /etc/cron.daily/ in $AUDITRULES" {
  run bash -c "grep '^-w /etc/cron.daily/ -p wa' $AUDITRULES"
  [ "$status" -eq 0 ]
}

@test "Verify /etc/cron.hourly/ in $AUDITRULES" {
  run bash -c "grep '^-w /etc/cron.hourly/ -p wa' $AUDITRULES"
  [ "$status" -eq 0 ]
}

@test "Verify /etc/cron.monthly/ in $AUDITRULES" {
  run bash -c "grep '^-w /etc/cron.monthly/ -p wa' $AUDITRULES"
  [ "$status" -eq 0 ]
}

@test "Verify /etc/cron.weekly/ in $AUDITRULES" {
  run bash -c "grep '^-w /etc/cron.weekly/ -p wa' $AUDITRULES"
  [ "$status" -eq 0 ]
}

@test "Verify /etc/crontab in $AUDITRULES" {
  run bash -c "grep '^-w /etc/crontab -p wa' $AUDITRULES"
  [ "$status" -eq 0 ]
}

@test "Verify /etc/group in $AUDITRULES" {
  run bash -c "grep '^-w /etc/group -p wa' $AUDITRULES"
  [ "$status" -eq 0 ]
}

@test "Verify /etc/passwd in $AUDITRULES" {
  run bash -c "grep '^-w /etc/passwd -p wa' $AUDITRULES"
  [ "$status" -eq 0 ]
}

@test "Verify /usr/bin/passwd in $AUDITRULES" {
  run bash -c "grep '^-w /usr/bin/passwd -p x' $AUDITRULES"
  [ "$status" -eq 0 ]
}

@test "Verify /usr/sbin/groupadd in $AUDITRULES" {
  run bash -c "grep '^-w /usr/sbin/groupadd -p x' $AUDITRULES"
  [ "$status" -eq 0 ]
}

@test "Verify /usr/sbin/groupmod in $AUDITRULES" {
  run bash -c "grep '^-w /usr/sbin/groupmod -p x' $AUDITRULES"
  [ "$status" -eq 0 ]
}

@test "Verify /usr/sbin/addgroup in $AUDITRULES" {
  run bash -c "grep '^-w /usr/sbin/addgroup -p x' $AUDITRULES"
  [ "$status" -eq 0 ]
}

@test "Verify /usr/sbin/useradd in $AUDITRULES" {
  run bash -c "grep '^-w /usr/sbin/useradd -p x' $AUDITRULES"
  [ "$status" -eq 0 ]
}

@test "Verify /usr/sbin/usermod in $AUDITRULES" {
  run bash -c "grep '^-w /usr/sbin/usermod -p x' $AUDITRULES"
  [ "$status" -eq 0 ]
}

@test "Verify /usr/sbin/adduser in $AUDITRULES" {
  run bash -c "grep '^-w /usr/sbin/adduser -p x' $AUDITRULES"
  [ "$status" -eq 0 ]
}

@test "Verify /sbin/insmod in $AUDITRULES" {
  run bash -c "grep '^-w /sbin/insmod -p x' $AUDITRULES"
  [ "$status" -eq 0 ]
}

@test "Verify /sbin/rmmod in $AUDITRULES" {
  run bash -c "grep '^-w /sbin/rmmod -p x' $AUDITRULES"
  [ "$status" -eq 0 ]
}

@test "Verify /sbin/modprobe in $AUDITRULES" {
  run bash -c "grep '^-w /sbin/modprobe -p x' $AUDITRULES"
  [ "$status" -eq 0 ]
}

@test "Verify /etc/login.defs in $AUDITRULES" {
  run bash -c "grep '^-w /etc/login.defs -p wa' $AUDITRULES"
  [ "$status" -eq 0 ]
}

@test "Verify /etc/securetty in $AUDITRULES" {
  run bash -c "grep '^-w /etc/securetty -p wa' $AUDITRULES"
  [ "$status" -eq 0 ]
}

@test "Verify /etc/hosts in $AUDITRULES" {
  run bash -c "grep '^-w /etc/hosts -p wa' $AUDITRULES"
  [ "$status" -eq 0 ]
}

@test "Verify /etc/network/ in $AUDITRULES" {
  run bash -c "grep '^-w /etc/network/ -p wa' $AUDITRULES"
  [ "$status" -eq 0 ]
}

@test "Verify /etc/inittab in $AUDITRULES" {
  run bash -c "grep '^-w /etc/inittab -p wa' $AUDITRULES"
  [ "$status" -eq 0 ]
}

@test "Verify /etc/init.d/ in $AUDITRULES" {
  run bash -c "grep '^-w /etc/init.d/ -p wa' $AUDITRULES"
  [ "$status" -eq 0 ]
}

@test "Verify /etc/init/ in $AUDITRULES" {
  run bash -c "grep '^-w /etc/init/ -p wa' $AUDITRULES"
  [ "$status" -eq 0 ]
}

@test "Verify /etc/ld.so.conf in $AUDITRULES" {
  run bash -c "grep '^-w /etc/ld.so.conf -p wa' $AUDITRULES"
  [ "$status" -eq 0 ]
}

@test "Verify /etc/localtime in $AUDITRULES" {
  run bash -c "grep '^-w /etc/localtime -p wa' $AUDITRULES"
  [ "$status" -eq 0 ]
}

@test "Verify /etc/timezone in $AUDITRULES" {
  run bash -c "grep '^-w /etc/timezone -p wa' $AUDITRULES"
  [ "$status" -eq 0 ]
}

@test "Verify /etc/sysctl.conf in $AUDITRULES" {
  run bash -c "grep '^-w /etc/sysctl.conf -p wa' $AUDITRULES"
  [ "$status" -eq 0 ]
}

@test "Verify /etc/modprobe.conf in $AUDITRULES" {
  run bash -c "grep '^-w /etc/modprobe.conf -p wa' $AUDITRULES"
  [ "$status" -eq 0 ]
}

@test "Verify /etc/modprobe.d/ in $AUDITRULES" {
  run bash -c "grep '^-w /etc/modprobe.d/ -p wa' $AUDITRULES"
  [ "$status" -eq 0 ]
}

@test "Verify /etc/modules in $AUDITRULES" {
  run bash -c "grep '^-w /etc/modules -p wa' $AUDITRULES"
  [ "$status" -eq 0 ]
}

@test "Verify /etc/pam.d/ in $AUDITRULES" {
  run bash -c "grep '^-w /etc/pam.d/ -p wa' $AUDITRULES"
  [ "$status" -eq 0 ]
}

@test "Verify /etc/security/limits.conf in $AUDITRULES" {
  run bash -c "grep '^-w /etc/security/limits.conf -p wa' $AUDITRULES"
  [ "$status" -eq 0 ]
}

@test "Verify /etc/security/pam_env.conf in $AUDITRULES" {
  run bash -c "grep '^-w /etc/security/pam_env.conf -p wa' $AUDITRULES"
  [ "$status" -eq 0 ]
}

@test "Verify /etc/security/namespace.conf in $AUDITRULES" {
  run bash -c "grep '^-w /etc/security/namespace.conf -p wa' $AUDITRULES"
  [ "$status" -eq 0 ]
}

@test "Verify /etc/security/namespace.init in $AUDITRULES" {
  run bash -c "grep '^-w /etc/security/namespace.init -p wa' $AUDITRULES"
  [ "$status" -eq 0 ]
}

@test "Verify /etc/aliases in $AUDITRULES" {
  run bash -c "grep '^-w /etc/aliases -p wa' $AUDITRULES"
  [ "$status" -eq 0 ]
}

@test "Verify /etc/postfix/ in $AUDITRULES" {
  run bash -c "grep '^-w /etc/postfix/ -p wa' $AUDITRULES"
  [ "$status" -eq 0 ]
}

@test "Verify /etc/issue in $AUDITRULES" {
  run bash -c "grep '^-w /etc/issue -p wa' $AUDITRULES"
  [ "$status" -eq 0 ]
}

@test "Verify /etc/issue.net in $AUDITRULES" {
  run bash -c "grep '^-w /etc/issue.net -p wa' $AUDITRULES"
  [ "$status" -eq 0 ]
}

@test "Verify /bin/su in $AUDITRULES" {
  run bash -c "grep '^-w /bin/su -p x' $AUDITRULES"
  [ "$status" -eq 0 ]
}

@test "Verify /usr/bin/sudo in $AUDITRULES" {
  run bash -c "grep '^-w /usr/bin/sudo -p x' $AUDITRULES"
  [ "$status" -eq 0 ]
}

@test "Verify /etc/sudoers in $AUDITRULES" {
  run bash -c " grep -P '^-w /etc/sudoers -p .?w' $AUDITRULES"
  [ "$status" -eq 0 ]
}

@test "Verify /sbin/shutdown in $AUDITRULES" {
  run bash -c "grep '^-w /sbin/shutdown -p x' $AUDITRULES"
  [ "$status" -eq 0 ]
}

@test "Verify /sbin/poweroff in $AUDITRULES" {
  run bash -c "grep '^-w /sbin/poweroff -p x' $AUDITRULES"
  [ "$status" -eq 0 ]
}

@test "Verify /sbin/reboot in $AUDITRULES" {
  run bash -c "grep '^-w /sbin/reboot -p x' $AUDITRULES"
  [ "$status" -eq 0 ]
}

@test "Verify /sbin/halt in $AUDITRULES" {
  run bash -c "grep '^-w /sbin/halt -p x' $AUDITRULES"
  [ "$status" -eq 0 ]
}
