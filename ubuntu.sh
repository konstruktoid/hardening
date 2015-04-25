#!/bin/bash
# konstruktoid.net
#
# Documentation:
# https://github.com/konstruktoid/hardening
# https://benchmarks.cisecurity.org/downloads/show-single/?file=ubuntu1404.100
# https://wiki.ubuntu.com/Security/Features
# https://help.ubuntu.com/community/StricterDefaults
#

FW_ADMIN="192.168.1.71"
SSH_GRPS="sudo"
SYSCTL_CONF="https://raw.githubusercontent.com/konstruktoid/ubuntu-conf/master/misc/sysctl.conf"
AUDITD_RULES="https://raw.githubusercontent.com/konstruktoid/ubuntu-conf/master/misc/audit.rules"
NTPSERVERPOOL="0.ubuntu.pool.ntp.org 1.ubuntu.pool.ntp.org 2.ubuntu.pool.ntp.org 3.ubuntu.pool.ntp.org pool.ntp.org"
VERBOSE="Y"
CHANGEME="ad" # Add something just to verify that you actually glanced the code

clear

if ! [ -x "`which systemctl`" ]
  then
    echo "systemctl required. Exiting."
    exit
fi

for s in `ls -1d ./scripts/[0-9_]*`; do
  . $s
done

pre
firewall
disablenet
disablemnt
systemdconf
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
kernelmodule
aide
rhosts
users
aptgetclean
suid
aide_post
checkreboot

echo
