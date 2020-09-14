#!/usr/bin/env bats

load test_helper

@test "Verify that audit is enabled" {
  run bash -c "grep 'audit=1' /proc/cmdline"
  [ "$status" -eq 0 ]
}

@test "Verify auditd is enabled" {
  run systemctl is-enabled auditd.service
  [ "$status" -eq 0 ]
}

@test "Verify auditd fail code in /etc/audit/*" {
  run bash -c "grep -R '^\-f [1,2]$' /etc/audit/*"
  [ "$status" -eq 0 ]
}
@test "Verify /etc/audit/ in /etc/audit/*" {
  run bash -c "grep -R '^-w /etc/audit -p wa' /etc/audit/*"
  [ "$status" -eq 0 ]
}

@test "Verify /etc/libaudit.conf in /etc/audit/*" {
  run bash -c "grep -R '^-w /etc/libaudit.conf -p wa' /etc/audit/*"
  [ "$status" -eq 0 ]
}

@test "Verify /etc/audisp/ in /etc/audit/*" {
  run bash -c "grep -R '^-w /etc/audisp -p wa' /etc/audit/*"
  [ "$status" -eq 0 ]
}

@test "Verify /sbin/auditctl in /etc/audit/*" {
  run bash -c "grep -R '^-w /sbin/auditctl -p x' /etc/audit/*"
  [ "$status" -eq 0 ]
}

@test "Verify /sbin/auditd in /etc/audit/*" {
  run bash -c "grep -R '^-w /sbin/auditd -p x' /etc/audit/*"
  [ "$status" -eq 0 ]
}

@test "Verify /etc/apparmor/ in /etc/audit/*" {
  run bash -c "grep -R '^-w /etc/apparmor -p wa' /etc/audit/*"
  [ "$status" -eq 0 ]
}

@test "Verify /etc/apparmor.d/ in /etc/audit/*" {
  run bash -c "grep -R '^-w /etc/apparmor.d -p wa' /etc/audit/*"
  [ "$status" -eq 0 ]
}

@test "Verify /sbin/apparmor_parser in /etc/audit/*" {
  run bash -c "grep -R '^-w /sbin/apparmor_parser -p x' /etc/audit/*"
  [ "$status" -eq 0 ]
}

@test "Verify /usr/sbin/aa-complain in /etc/audit/*" {
  run bash -c "grep -R '^-w /usr/sbin/aa-complain -p x' /etc/audit/*"
  [ "$status" -eq 0 ]
}

@test "Verify /usr/sbin/aa-disable in /etc/audit/*" {
  run bash -c "grep -R '^-w /usr/sbin/aa-disable -p x' /etc/audit/*"
  [ "$status" -eq 0 ]
}

@test "Verify /usr/sbin/aa-enforce in /etc/audit/*" {
  run bash -c "grep -R '^-w /usr/sbin/aa-enforce -p x' /etc/audit/*"
  [ "$status" -eq 0 ]
}

@test "Verify /etc/systemd/ in /etc/audit/*" {
  run bash -c "grep -R '^-w /etc/systemd -p wa' /etc/audit/*"
  [ "$status" -eq 0 ]
}

@test "Verify /bin/systemctl in /etc/audit/*" {
  run bash -c "grep -R '^-w /bin/systemctl -p x' /etc/audit/*"
  [ "$status" -eq 0 ]
}

@test "Verify /bin/journalctl in /etc/audit/*" {
  run bash -c "grep -R '^-w /bin/journalctl -p x' /etc/audit/*"
  [ "$status" -eq 0 ]
}

@test "Verify /etc/cron.allow in /etc/audit/*" {
  run bash -c "grep -R '^-w /etc/cron.allow -p wa' /etc/audit/*"
  [ "$status" -eq 0 ]
}

@test "Verify /etc/cron.deny in /etc/audit/*" {
  run bash -c "grep -R '^-w /etc/cron.deny -p wa' /etc/audit/*"
  [ "$status" -eq 0 ]
}

@test "Verify /etc/cron.d/ in /etc/audit/*" {
  run bash -c "grep -R '^-w /etc/cron.d -p wa' /etc/audit/*"
  [ "$status" -eq 0 ]
}

@test "Verify /etc/cron.daily/ in /etc/audit/*" {
  run bash -c "grep -R '^-w /etc/cron.daily -p wa' /etc/audit/*"
  [ "$status" -eq 0 ]
}

@test "Verify /etc/cron.hourly/ in /etc/audit/*" {
  run bash -c "grep -R '^-w /etc/cron.hourly -p wa' /etc/audit/*"
  [ "$status" -eq 0 ]
}

@test "Verify /etc/cron.monthly/ in /etc/audit/*" {
  run bash -c "grep -R '^-w /etc/cron.monthly -p wa' /etc/audit/*"
  [ "$status" -eq 0 ]
}

@test "Verify /etc/cron.weekly/ in /etc/audit/*" {
  run bash -c "grep -R '^-w /etc/cron.weekly -p wa' /etc/audit/*"
  [ "$status" -eq 0 ]
}

@test "Verify /etc/crontab in /etc/audit/*" {
  run bash -c "grep -R '^-w /etc/crontab -p wa' /etc/audit/*"
  [ "$status" -eq 0 ]
}

@test "Verify /etc/group in /etc/audit/*" {
  run bash -c "grep -R '^-w /etc/group -p wa' /etc/audit/*"
  [ "$status" -eq 0 ]
}

@test "Verify /etc/passwd in /etc/audit/*" {
  run bash -c "grep -R '^-w /etc/passwd -p wa' /etc/audit/*"
  [ "$status" -eq 0 ]
}

@test "Verify /usr/bin/passwd in /etc/audit/*" {
  run bash -c "grep -R '^-w /usr/bin/passwd -p x' /etc/audit/*"
  [ "$status" -eq 0 ]
}

@test "Verify /usr/sbin/groupadd in /etc/audit/*" {
  run bash -c "grep -R '^-w /usr/sbin/groupadd -p x' /etc/audit/*"
  [ "$status" -eq 0 ]
}

@test "Verify /usr/sbin/groupmod in /etc/audit/*" {
  run bash -c "grep -R '^-w /usr/sbin/groupmod -p x' /etc/audit/*"
  [ "$status" -eq 0 ]
}

@test "Verify /usr/sbin/addgroup in /etc/audit/*" {
  run bash -c "grep -R '^-w /usr/sbin/addgroup -p x' /etc/audit/*"
  [ "$status" -eq 0 ]
}

@test "Verify /usr/sbin/useradd in /etc/audit/*" {
  run bash -c "grep -R '^-w /usr/sbin/useradd -p x' /etc/audit/*"
  [ "$status" -eq 0 ]
}

@test "Verify /usr/sbin/usermod in /etc/audit/*" {
  run bash -c "grep -R '^-w /usr/sbin/usermod -p x' /etc/audit/*"
  [ "$status" -eq 0 ]
}

@test "Verify /usr/sbin/adduser in /etc/audit/*" {
  run bash -c "grep -R '^-w /usr/sbin/adduser -p x' /etc/audit/*"
  [ "$status" -eq 0 ]
}

@test "Verify /sbin/insmod in /etc/audit/*" {
  run bash -c "grep -R '^-w /sbin/insmod -p x' /etc/audit/*"
  [ "$status" -eq 0 ]
}

@test "Verify /sbin/rmmod in /etc/audit/*" {
  run bash -c "grep -R '^-w /sbin/rmmod -p x' /etc/audit/*"
  [ "$status" -eq 0 ]
}

@test "Verify /sbin/modprobe in /etc/audit/*" {
  run bash -c "grep -R '^-w /sbin/modprobe -p x' /etc/audit/*"
  [ "$status" -eq 0 ]
}

@test "Verify /etc/login.defs in /etc/audit/*" {
  run bash -c "grep -R '^-w /etc/login.defs -p wa' /etc/audit/*"
  [ "$status" -eq 0 ]
}

@test "Verify /etc/securetty in /etc/audit/*" {
  run bash -c "grep -R '^-w /etc/securetty -p wa' /etc/audit/*"
  [ "$status" -eq 0 ]
}

@test "Verify /etc/hosts in /etc/audit/*" {
  run bash -c "grep -R '^-w /etc/hosts -p wa' /etc/audit/*"
  [ "$status" -eq 0 ]
}

@test "Verify /etc/network/ in /etc/audit/*" {
  run bash -c "grep -R '^-w /etc/network -p wa' /etc/audit/*"
  [ "$status" -eq 0 ]
}

@test "Verify /etc/inittab in /etc/audit/*" {
  run bash -c "grep -R '^-w /etc/inittab -p wa' /etc/audit/*"
  [ "$status" -eq 0 ]
}

@test "Verify /etc/init.d/ in /etc/audit/*" {
  run bash -c "grep -R '^-w /etc/init.d -p wa' /etc/audit/*"
  [ "$status" -eq 0 ]
}

@test "Verify /etc/init/ in /etc/audit/*" {
  run bash -c "grep -R '^-w /etc/init -p wa' /etc/audit/*"
  [ "$status" -eq 0 ]
}

@test "Verify /etc/ld.so.conf in /etc/audit/*" {
  run bash -c "grep -R '^-w /etc/ld.so.conf -p wa' /etc/audit/*"
  [ "$status" -eq 0 ]
}

@test "Verify /etc/localtime in /etc/audit/*" {
  run bash -c "grep -R '^-w /etc/localtime -p wa' /etc/audit/*"
  [ "$status" -eq 0 ]
}

@test "Verify /etc/timezone in /etc/audit/*" {
  run bash -c "grep -R '^-w /etc/timezone -p wa' /etc/audit/*"
  [ "$status" -eq 0 ]
}

@test "Verify /etc/sysctl.conf in /etc/audit/*" {
  run bash -c "grep -R '^-w /etc/sysctl.conf -p wa' /etc/audit/*"
  [ "$status" -eq 0 ]
}

@test "Verify /etc/modprobe.conf in /etc/audit/*" {
  run bash -c "grep -R '^-w /etc/modprobe.conf -p wa' /etc/audit/*"
  [ "$status" -eq 0 ]
}

@test "Verify /etc/modprobe.d/ in /etc/audit/*" {
  run bash -c "grep -R '^-w /etc/modprobe.d -p wa' /etc/audit/*"
  [ "$status" -eq 0 ]
}

@test "Verify /etc/modules in /etc/audit/*" {
  run bash -c "grep -R '^-w /etc/modules -p wa' /etc/audit/*"
  [ "$status" -eq 0 ]
}

@test "Verify /etc/pam.d/ in /etc/audit/*" {
  run bash -c "grep -R '^-w /etc/pam.d -p wa' /etc/audit/*"
  [ "$status" -eq 0 ]
}

@test "Verify /etc/security/limits.conf in /etc/audit/*" {
  run bash -c "grep -R '^-w /etc/security/limits.conf -p wa' /etc/audit/*"
  [ "$status" -eq 0 ]
}

@test "Verify /etc/security/pam_env.conf in /etc/audit/*" {
  run bash -c "grep -R '^-w /etc/security/pam_env.conf -p wa' /etc/audit/*"
  [ "$status" -eq 0 ]
}

@test "Verify /etc/security/namespace.conf in /etc/audit/*" {
  run bash -c "grep -R '^-w /etc/security/namespace.conf -p wa' /etc/audit/*"
  [ "$status" -eq 0 ]
}

@test "Verify /etc/security/namespace.init in /etc/audit/*" {
  run bash -c "grep -R '^-w /etc/security/namespace.init -p wa' /etc/audit/*"
  [ "$status" -eq 0 ]
}

@test "Verify /etc/aliases in /etc/audit/*" {
  run bash -c "grep -R '^-w /etc/aliases -p wa' /etc/audit/*"
  [ "$status" -eq 0 ]
}

@test "Verify /etc/postfix/ in /etc/audit/*" {
  run bash -c "grep -RE '^-w /etc/postfix([^\s]|/[^\s])-p wa' /etc/audit/*"
  [ "$status" -eq 0 ]
}

@test "Verify /etc/issue in /etc/audit/*" {
  run bash -c "grep -R '^-w /etc/issue -p wa' /etc/audit/*"
  [ "$status" -eq 0 ]
}

@test "Verify /etc/issue.net in /etc/audit/*" {
  run bash -c "grep -R '^-w /etc/issue.net -p wa' /etc/audit/*"
  [ "$status" -eq 0 ]
}

@test "Verify /bin/su in /etc/audit/*" {
  run bash -c "grep -R '^-w /bin/su -p x' /etc/audit/*"
  [ "$status" -eq 0 ]
}

@test "Verify /usr/bin/sudo in /etc/audit/*" {
  run bash -c "grep -R '^-w /usr/bin/sudo -p x' /etc/audit/*"
  [ "$status" -eq 0 ]
}

@test "Verify /etc/sudoers in /etc/audit/*" {
  run bash -c "grep -R '^-w /etc/sudoers -p wa' /etc/audit/*"
  [ "$status" -eq 0 ]
}

@test "Verify /etc/sudoers.d/ in /etc/audit/*" {
  run bash -c "grep -RE '^-w /etc/sudoers.d([^\s]|/[^\s])-p wa' /etc/audit/*"
  [ "$status" -eq 0 ]
}

@test "Verify /sbin/shutdown in /etc/audit/*" {
  run bash -c "grep -R '^-w /sbin/shutdown -p x' /etc/audit/*"
  [ "$status" -eq 0 ]
}

@test "Verify /sbin/poweroff in /etc/audit/*" {
  run bash -c "grep -R '^-w /sbin/poweroff -p x' /etc/audit/*"
  [ "$status" -eq 0 ]
}

@test "Verify /sbin/reboot in /etc/audit/*" {
  run bash -c "grep -R '^-w /sbin/reboot -p x' /etc/audit/*"
  [ "$status" -eq 0 ]
}

@test "Verify /sbin/halt in /etc/audit/*" {
  run bash -c "grep -R '^-w /sbin/halt -p x' /etc/audit/*"
  [ "$status" -eq 0 ]
}


@test "Verify auditd runtime fail code" {
  run bash -c "auditctl -s | grep 'failure [1,2]'"
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
