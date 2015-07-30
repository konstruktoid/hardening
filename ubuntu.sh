#!/bin/bash
# konstruktoid.net
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
  echo "$s"
done

pre
firewall
disablenet
disablemnt
disablemod
systemdconf
resolvedconf
logindconf
journalctl
timesyncd
fstab
prelink
aptget
hosts
logindefs
sysctl
limitsconf
adduser
rootaccess
packages
sshdconfig
password
cron
ctrlaltdel
auditd
aide
rhosts
users
aptget_clean
suid
rc
path
aa_enforce
aide_post
aide_timer
checkreboot

echo
