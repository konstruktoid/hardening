#!/usr/bin/env bash
#
# Documentation:
# https://github.com/konstruktoid/hardening
# https://benchmarks.cisecurity.org/downloads/show-single/?file=ubuntu1404.100
# https://wiki.ubuntu.com/Security/Features
# https://help.ubuntu.com/community/StricterDefaults
#

FW_ADMIN="127.0.0.1"
SSH_GRPS="sudo"
SYSCTL_CONF="https://raw.githubusercontent.com/konstruktoid/ubuntu-conf/master/misc/sysctl.conf"
AUDITD_RULES="https://raw.githubusercontent.com/konstruktoid/ubuntu-conf/master/misc/audit.rules"
NTPSERVERPOOL="0.ubuntu.pool.ntp.org 1.ubuntu.pool.ntp.org 2.ubuntu.pool.ntp.org 3.ubuntu.pool.ntp.org pool.ntp.org"
VERBOSE="N"
CHANGEME="" # Add something just to verify that you actually glanced the code

clear

if ! [ -x "$(which systemctl)" ]
  then
    echo "systemctl required. Exiting."
    exit
fi

for s in ./scripts/[0-9_]*; do
  [[ -e $s ]] || break
  source "$s"
done

f_pre
f_firewall
f_disablenet
f_disablemnt
f_disablemod
f_systemdconf
f_resolvedconf
f_logindconf
f_journalctl
f_timesyncd
f_fstab
f_prelink
f_aptget
f_hosts
f_logindefs
f_sysctl
f_limitsconf
f_adduser
f_rootaccess
f_packages
f_sshdconfig
f_password
f_cron
f_ctrlaltdel
f_auditd
f_aide
f_rhosts
f_users
f_aptget_clean
f_suid
f_rc
f_path
f_aa_enforce
f_aide_post
f_aide_timer
f_checkreboot

echo
