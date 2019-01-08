#!/bin/bash

# shellcheck disable=2009
if ! ps -p $$ | grep -si bash; then
  echo "Sorry, this script requires bash."
  exit 1
fi

if ! [ -x "$(command -v systemctl)" ]; then
  echo "systemctl required. Exiting."
  exit 1
fi

function main {
  clear

  if grep -s "AUTOFILL='Y'" ./ubuntu.cfg; then
    USERIP="$(w -ih | awk '{print $3}' | head -n1)"

    if [[ "$USERIP" =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
      ADMINIP="$USERIP"
    else
      ADMINIP=""
    fi

    sed -i "s/FW_ADMIN='/FW_ADMIN='$ADMINIP /" ./ubuntu.cfg
    sed -i "s/SSH_GRPS='/SSH_GRPS='$(id "$(w -ih | awk '{print $1}' | head -n1)" -ng) /" ./ubuntu.cfg
    sed -i "s/CHANGEME=''/CHANGEME='$(date +%s)'/" ./ubuntu.cfg
    sed -i "s/VERBOSE='N'/VERBOSE='Y'/" ./ubuntu.cfg
  fi

  source ./ubuntu.cfg

  readonly FW_ADMIN
  readonly SSH_GRPS
  readonly SYSCTL_CONF
  readonly AUDITD_MODE
  readonly AUDITD_RULES
  readonly LOGROTATE_CONF
  readonly NTPSERVERPOOL
  readonly TIMEDATECTL
  readonly VERBOSE
  readonly CHANGEME
  readonly ADDUSER
  readonly AUDITDCONF
  readonly AUDITRULES
  readonly COMMONPASSWD
  readonly COMMONACCOUNT
  readonly COMMONAUTH
  readonly COREDUMPCONF
  readonly DEFAULTGRUB
  readonly DISABLEMNT
  readonly DISABLEMOD
  readonly DISABLENET
  readonly JOURNALDCONF
  readonly LIMITSCONF
  readonly LOGINDCONF
  readonly LOGINDEFS
  readonly LOGROTATE
  readonly PAMLOGIN
  readonly RESOLVEDCONF
  readonly RKHUNTERCONF
  readonly SECURITYACCESS
  readonly SSHDFILE
  readonly SYSCTL
  readonly SYSTEMCONF
  readonly TIMESYNCD
  readonly UFWDEFAULT
  readonly USERADD
  readonly USERCONF

  # shellcheck disable=1090
  for s in ./scripts/[0-9_]*; do
    [[ -e $s ]] || break

    source "$s"
  done

  f_pre
  f_firewall
  f_disablenet
  f_disablefs
  f_disablemod
  f_systemdconf
  f_resolvedconf
  f_logindconf
  f_journalctl
  f_timesyncd
  f_fstab
  f_prelink
  f_aptget_configure
  f_aptget
  f_hosts
  f_issue
  f_logindefs
  f_sysctl
  f_limitsconf
  f_adduser
  f_rootaccess
  f_package_remove
  f_package_install
  f_coredump
  f_usbguard
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
  f_restrictcompilers
  f_umask
  f_path
  f_aa_enforce
  f_aide_post
  f_aide_timer
  f_aptget_noexec
  f_systemddelta
  f_checkreboot

  echo
}

LOGFILE="hardening-$(hostname --short)-$(date +%y%m%d).log"
echo "[HARDENING LOG - $(hostname --fqdn) - $(LANG=C date)]" >> "$LOGFILE"

main "$@" | tee -a "$LOGFILE"
