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
  run bash -c "grep -E '^-w /etc/postfix([^\s]|/[^\s])-p wa' $AUDITRULES"
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
  run bash -c "grep '^-w /etc/sudoers -p wa' $AUDITRULES"
  [ "$status" -eq 0 ]
}

@test "Verify /etc/sudoers.d/ in $AUDITRULES" {
  run bash -c "grep -E '^-w /etc/sudoers.d([^\s]|/[^\s])-p wa' $AUDITRULES"
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

@test "Verify auditd runtime /etc/audit/" {
  run auditctlRuntime '^-w /etc/audit([^\s]|/[^\s])-p wa'
  [ "$status" -eq 0 ]
}

@test "Verify auditd runtime /etc/libaudit.conf" {
  run auditctlRuntime '^-w /etc/libaudit.conf -p wa'
  [ "$status" -eq 0 ]
}

@test "Verify auditd runtime /etc/audisp/" {
  run auditctlRuntime '^-w /etc/audisp([^\s]|/[^\s])-p wa'
  [ "$status" -eq 0 ]
}

@test "Verify auditd runtime /sbin/auditctl" {
  run auditctlRuntime '^-w /sbin/auditctl -p x'
  [ "$status" -eq 0 ]
}

@test "Verify auditd runtime /sbin/auditd" {
  run auditctlRuntime '^-w /sbin/auditd -p x'
  [ "$status" -eq 0 ]
}

@test "Verify auditd runtime /etc/apparmor/" {
  run auditctlRuntime '^-w /etc/apparmor([^\s]|/[^\s])-p wa'
  [ "$status" -eq 0 ]
}

@test "Verify auditd runtime /etc/apparmor.d/" {
  run auditctlRuntime '^-w /etc/apparmor.d([^\s]|/[^\s])-p wa'
  [ "$status" -eq 0 ]
}

@test "Verify auditd runtime /sbin/apparmor_parser" {
  run auditctlRuntime '^-w /sbin/apparmor_parser -p x'
  [ "$status" -eq 0 ]
}

@test "Verify auditd runtime /usr/sbin/aa-complain" {
  run auditctlRuntime '^-w /usr/sbin/aa-complain -p x'
  [ "$status" -eq 0 ]
}

@test "Verify auditd runtime /usr/sbin/aa-disable" {
  run auditctlRuntime '^-w /usr/sbin/aa-disable -p x'
  [ "$status" -eq 0 ]
}

@test "Verify auditd runtime /usr/sbin/aa-enforce" {
  run auditctlRuntime '^-w /usr/sbin/aa-enforce -p x'
  [ "$status" -eq 0 ]
}

@test "Verify auditd runtime /etc/systemd/" {
  run auditctlRuntime '^-w /etc/systemd([^\s]|/[^\s])-p wa'
  [ "$status" -eq 0 ]
}

@test "Verify auditd runtime /bin/systemctl" {
  run auditctlRuntime '^-w /bin/systemctl -p x'
  [ "$status" -eq 0 ]
}

@test "Verify auditd runtime /bin/journalctl" {
  run auditctlRuntime '^-w /bin/journalctl -p x'
  [ "$status" -eq 0 ]
}
@test "Verify auditd runtime /bin/journalctl" {
  run auditctlRuntime '^-w /bin/journalctl -p x'
  [ "$status" -eq 0 ]
}

@test "Verify auditd runtime /etc/cron.allow" {
  run auditctlRuntime '^-w /etc/cron.allow -p wa'
  [ "$status" -eq 0 ]
}

@test "Verify auditd runtime /etc/cron.deny" {
  run auditctlRuntime '^-w /etc/cron.deny -p wa'
  [ "$status" -eq 0 ]
}

@test "Verify auditd runtime /etc/cron.d/" {
  run auditctlRuntime '^-w /etc/cron.d([^\s]|/[^\s])-p wa'
  [ "$status" -eq 0 ]
}

@test "Verify auditd runtime /etc/cron.daily/" {
  run auditctlRuntime '^-w /etc/cron.daily([^\s]|/[^\s])-p wa'
  [ "$status" -eq 0 ]
}

@test "Verify auditd runtime /etc/cron.hourly/" {
  run auditctlRuntime '^-w /etc/cron.hourly([^\s]|/[^\s])-p wa'
  [ "$status" -eq 0 ]
}

@test "Verify auditd runtime /etc/cron.monthly/" {
  run auditctlRuntime '^-w /etc/cron.monthly([^\s]|/[^\s])-p wa'
  [ "$status" -eq 0 ]
}

@test "Verify auditd runtime /etc/cron.weekly/" {
  run auditctlRuntime '^-w /etc/cron.weekly([^\s]|/[^\s])-p wa'
  [ "$status" -eq 0 ]
}

@test "Verify auditd runtime /etc/crontab" {
  run auditctlRuntime '^-w /etc/crontab -p wa'
  [ "$status" -eq 0 ]
}

@test "Verify auditd runtime /etc/group" {
  run auditctlRuntime '^-w /etc/group -p wa'
  [ "$status" -eq 0 ]
}

@test "Verify auditd runtime /etc/passwd" {
  run auditctlRuntime '^-w /etc/passwd -p wa'
  [ "$status" -eq 0 ]
}

@test "Verify auditd runtime /usr/bin/passwd" {
  run auditctlRuntime '^-w /usr/bin/passwd -p x'
  [ "$status" -eq 0 ]
}

@test "Verify auditd runtime /usr/sbin/groupadd" {
  run auditctlRuntime '^-w /usr/sbin/groupadd -p x'
  [ "$status" -eq 0 ]
}

@test "Verify auditd runtime /usr/sbin/groupmod" {
  run auditctlRuntime '^-w /usr/sbin/groupmod -p x'
  [ "$status" -eq 0 ]
}

@test "Verify auditd runtime /usr/sbin/addgroup" {
  run auditctlRuntime '^-w /usr/sbin/addgroup -p x'
  [ "$status" -eq 0 ]
}

@test "Verify auditd runtime /usr/sbin/useradd" {
  run auditctlRuntime '^-w /usr/sbin/useradd -p x'
  [ "$status" -eq 0 ]
}

@test "Verify auditd runtime /usr/sbin/usermod" {
  run auditctlRuntime '^-w /usr/sbin/usermod -p x'
  [ "$status" -eq 0 ]
}

@test "Verify auditd runtime /usr/sbin/adduser" {
  run auditctlRuntime '^-w /usr/sbin/adduser -p x'
  [ "$status" -eq 0 ]
}

@test "Verify auditd runtime /sbin/insmod" {
  run auditctlRuntime '^-w /sbin/insmod -p x'
  [ "$status" -eq 0 ]
}

@test "Verify auditd runtime /sbin/rmmod" {
  run auditctlRuntime '^-w /sbin/rmmod -p x'
  [ "$status" -eq 0 ]
}

@test "Verify auditd runtime /sbin/modprobe" {
  run auditctlRuntime '^-w /sbin/modprobe -p x'
  [ "$status" -eq 0 ]
}

@test "Verify auditd runtime /etc/login.defs" {
  run auditctlRuntime '^-w /etc/login.defs -p wa'
  [ "$status" -eq 0 ]
}

@test "Verify auditd runtime /etc/securetty" {
  run auditctlRuntime '^-w /etc/securetty -p wa'
  [ "$status" -eq 0 ]
}

@test "Verify auditd runtime /etc/hosts" {
  run auditctlRuntime '^-w /etc/hosts -p wa'
  [ "$status" -eq 0 ]
}

@test "Verify auditd runtime /etc/network/" {
  run auditctlRuntime '^-w /etc/network([^\s]|/[^\s])-p wa'
  [ "$status" -eq 0 ]
}

@test "Verify auditd runtime /etc/inittab" {
  run auditctlRuntime '^-w /etc/inittab -p wa'
  [ "$status" -eq 0 ]
}

@test "Verify auditd runtime /etc/init.d/" {
  run auditctlRuntime '^-w /etc/init.d([^\s]|/[^\s])-p wa'
  [ "$status" -eq 0 ]
}

@test "Verify auditd runtime /etc/init/" {
  run auditctlRuntime '^-w /etc/init([^\s]|/[^\s])-p wa'
  [ "$status" -eq 0 ]
}

@test "Verify auditd runtime /etc/ld.so.conf" {
  run auditctlRuntime '^-w /etc/ld.so.conf -p wa'
  [ "$status" -eq 0 ]
}

@test "Verify auditd runtime /etc/localtime" {
  run auditctlRuntime '^-w /etc/localtime -p wa'
  [ "$status" -eq 0 ]
}

@test "Verify auditd runtime /etc/timezone" {
  run auditctlRuntime '^-w /etc/timezone -p wa'
  [ "$status" -eq 0 ]
}

@test "Verify auditd runtime /etc/sysctl.conf" {
  run auditctlRuntime '^-w /etc/sysctl.conf -p wa'
  [ "$status" -eq 0 ]
}

@test "Verify auditd runtime /etc/modprobe.conf" {
  run auditctlRuntime '^-w /etc/modprobe.conf -p wa'
  [ "$status" -eq 0 ]
}

@test "Verify auditd runtime /etc/modprobe.d/" {
  run auditctlRuntime '^-w /etc/modprobe.d([^\s]|/[^\s])-p wa'
  [ "$status" -eq 0 ]
}

@test "Verify auditd runtime /etc/modules" {
  run auditctlRuntime '^-w /etc/modules -p wa'
  [ "$status" -eq 0 ]
}

@test "Verify auditd runtime /etc/pam.d/" {
  run auditctlRuntime '^-w /etc/pam.d([^\s]|/[^\s])-p wa'
  [ "$status" -eq 0 ]
}

@test "Verify auditd runtime /etc/security/limits.conf" {
  run auditctlRuntime '^-w /etc/security/limits.conf -p wa'
  [ "$status" -eq 0 ]
}

@test "Verify auditd runtime /etc/security/pam_env.conf" {
  run auditctlRuntime '^-w /etc/security/pam_env.conf -p wa'
  [ "$status" -eq 0 ]
}

@test "Verify auditd runtime /etc/security/namespace.conf" {
  run auditctlRuntime '^-w /etc/security/namespace.conf -p wa'
  [ "$status" -eq 0 ]
}

@test "Verify auditd runtime /etc/security/namespace.init" {
  run auditctlRuntime '^-w /etc/security/namespace.init -p wa'
  [ "$status" -eq 0 ]
}

@test "Verify auditd runtime /etc/aliases" {
  run auditctlRuntime '^-w /etc/aliases -p wa'
  [ "$status" -eq 0 ]
}

@test "Verify auditd runtime /etc/postfix/" {
  run auditctlRuntime '^-w /etc/postfix([^\s]|/[^\s])-p wa'
  [ "$status" -eq 0 ]
}

@test "Verify auditd runtime /etc/issue" {
  run auditctlRuntime '^-w /etc/issue -p wa'
  [ "$status" -eq 0 ]
}

@test "Verify auditd runtime /etc/issue.net" {
  run auditctlRuntime '^-w /etc/issue.net -p wa'
  [ "$status" -eq 0 ]
}

@test "Verify auditd runtime /bin/su" {
  run auditctlRuntime '^-w /bin/su -p x'
  [ "$status" -eq 0 ]
}

@test "Verify auditd runtime /usr/bin/sudo" {
  run auditctlRuntime '^-w /usr/bin/sudo -p x'
  [ "$status" -eq 0 ]
}

@test "Verify auditd runtime /etc/sudoers" {
  run auditctlRuntime '^-w /etc/sudoers -p wa'
  [ "$status" -eq 0 ]
}

@test "Verify auditd runtime /etc/sudoers.d/" {
  run auditctlRuntime '^-w /etc/sudoers.d([^\s]|/[^\s])-p wa'
  [ "$status" -eq 0 ]
}

@test "Verify auditd runtime /sbin/shutdown" {
  run auditctlRuntime '^-w /sbin/shutdown -p x'
  [ "$status" -eq 0 ]
}

@test "Verify auditd runtime /sbin/poweroff" {
  run auditctlRuntime '^-w /sbin/poweroff -p x'
  [ "$status" -eq 0 ]
}

@test "Verify auditd runtime /sbin/reboot" {
  run auditctlRuntime '^-w /sbin/reboot -p x'
  [ "$status" -eq 0 ]
}

@test "Verify auditd runtime /sbin/halt" {
  run auditctlRuntime '^-w /sbin/halt -p x'
  [ "$status" -eq 0 ]
}
