#!/bin/bash

if ! ps -p $$ | grep -i bash; then
       echo "Sorry, this script requires bash."
       exit 1
fi

if ! [ -x "$(which systemctl)" ]
  then
    echo "systemctl required. Exiting."
    exit 1
fi

clear

source ./ubuntu.cfg

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
f_coredump
f_fstab
f_prelink
f_aptget
f_hosts
f_issue
f_logindefs
f_sysctl
f_limitsconf
f_adduser
f_rootaccess
f_packages
f_postfix
f_apport
f_motdnews
f_rkhunter
f_sshdconfig
f_password
f_cron
f_ctrlaltdel
f_auditd
f_aide
f_rhosts
f_users
f_lockroot
f_aptget_clean
f_suid
f_umask
f_path
f_aa_enforce
f_aide_post
f_aide_timer
f_systemddelta
f_checkreboot

echo
