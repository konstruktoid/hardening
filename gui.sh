#!/usr/bin/env bash
#
# gui.sh — whiptail GUI front-end for this repo's hardening controls.
#
# Lets an operator select which controls their organisation's security
# policy requires, writes the corresponding values into ubuntu.cfg, toggles
# the optional f_* calls inside ubuntu.sh to match, and then runs the
# existing sudo bash ubuntu.sh workflow unchanged.
#
# This does not alter how ubuntu.sh or ubuntu.cfg work on their own; it only
# adds a GUI layer on top of them.
#
# Usage: sudo bash gui.sh
#
set -euo pipefail
REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CFG="$REPO_DIR/ubuntu.cfg"
SCRIPT="$REPO_DIR/ubuntu.sh"

if [[ $EUID -ne 0 ]]; then
    echo "Run with sudo: sudo bash gui.sh"
    exit 1
fi

if ! command -v whiptail >/dev/null 2>&1; then
    apt-get -y install whiptail
fi

[[ -f "$CFG" && -f "$SCRIPT" ]] || {
    echo "ubuntu.cfg / ubuntu.sh not found next to gui.sh — run from the repo root."
    exit 1
}

cp -a "$CFG" "${CFG}.gui-orig"
cp -a "$SCRIPT" "${SCRIPT}.gui-orig"

# ---------------------------------------------------------------------------
# Optional, policy-sensitive controls. These are the real f_* functions
# already defined and called in this repo's ubuntu.sh. Structural/baseline
# functions (f_pre, f_kernel, f_fstab, f_post, f_checkreboot, etc.) are left
# untouched, since they are not organisational policy choices.
# ---------------------------------------------------------------------------
CHOICES=$(whiptail --title "Ubuntu Hardening — Organisation Policy" \
  --checklist "Space to toggle, Enter to confirm:" 24 78 15 \
  "f_firewall"      "Enable UFW firewall"                      ON \
  "f_sshdconfig"    "Harden sshd (disable root login, etc.)"   ON \
  "f_disablemod"    "Block USB storage / Bluetooth / FireWire" ON \
  "f_disablenet"    "Disable uncommon network kernel modules"  ON \
  "f_disablefs"     "Disable uncommon filesystem kernel modules" ON \
  "f_usbguard"      "Enable USBGuard device allow-list"        OFF \
  "f_auditd"        "Enable auditd baseline rules"             ON \
  "f_aide"          "Enable AIDE file-integrity monitoring"    OFF \
  "f_rkhunter"      "Enable rkhunter rootkit scanner"          OFF \
  "f_psad"          "Enable PSAD port-scan detection"          OFF \
  "f_password"      "Enforce password quality policy"          ON \
  "f_lockroot"      "Lock direct root login"                   ON \
  "f_ctrlaltdel"    "Disable Ctrl-Alt-Del reboot"               ON \
  "f_aa_enforce"    "Enforce AppArmor profiles"                 ON \
  3>&1 1>&2 2>&3) || { echo "Cancelled."; exit 1; }

# ---------------------------------------------------------------------------
# Tor blocking — no dedicated f_ function exists for this upstream, so gui.sh
# applies it directly (firewall + package removal) without touching ubuntu.sh.
# ---------------------------------------------------------------------------
BLOCK_TOR=0
if whiptail --title "Tor" --yesno "Block Tor network usage (outbound OR/directory ports)?" 8 60; then
    BLOCK_TOR=1
fi

# ---------------------------------------------------------------------------
# Organisation-specific parameter values (existing ubuntu.cfg keys).
# ---------------------------------------------------------------------------
FW_ADMIN=$(whiptail --inputbox "Admin IP(s) allowed through firewall (space-separated):" 10 60 "127.0.0.1" 3>&1 1>&2 2>&3)
SSH_GRPS=$(whiptail --inputbox "Which group(s) may use SSH (space-separated):" 10 60 "sudo" 3>&1 1>&2 2>&3)
SSH_PORT=$(whiptail --inputbox "SSH port:" 10 60 "22" 3>&1 1>&2 2>&3)
ADMINEMAIL=$(whiptail --inputbox "Admin email (for psad/rkhunter notifications):" 10 60 "root@localhost" 3>&1 1>&2 2>&3)
CHANGEME=$(whiptail --inputbox "CHANGEME marker (any non-empty value — required by ubuntu.sh):" 10 60 "reviewed-by-ntro" 3>&1 1>&2 2>&3)

GRUB_PW=""
if whiptail --title "GRUB" --yesno "Set a GRUB bootloader password now?" 8 60; then
    GRUB_PW=$(whiptail --passwordbox "Enter GRUB password:" 10 60 3>&1 1>&2 2>&3)
fi

# ---------------------------------------------------------------------------
# Write chosen values into the real ubuntu.cfg.
# ---------------------------------------------------------------------------
sed -i "s|^FW_ADMIN=.*|FW_ADMIN='${FW_ADMIN}'|" "$CFG"
sed -i "s|^SSH_GRPS=.*|SSH_GRPS='${SSH_GRPS}'|" "$CFG"
sed -i "s|^SSH_PORT=.*|SSH_PORT='${SSH_PORT}'|" "$CFG"
sed -i "s|^ADMINEMAIL=.*|ADMINEMAIL='${ADMINEMAIL}'|" "$CFG"
sed -i "s|^CHANGEME=.*|CHANGEME='${CHANGEME}' # set via gui.sh|" "$CFG"

echo "[gui.sh] ubuntu.cfg updated with organisation policy values."

# ---------------------------------------------------------------------------
# Comment out any optional f_* call NOT selected, in ubuntu.sh's function
# list, so only chosen controls actually execute. Baseline/structural
# functions are left untouched.
# ---------------------------------------------------------------------------
ALL_OPTIONAL=(f_firewall f_sshdconfig f_disablemod f_disablenet f_disablefs
              f_usbguard f_auditd f_aide f_rkhunter f_psad f_password
              f_lockroot f_ctrlaltdel f_aa_enforce)

for fn in "${ALL_OPTIONAL[@]}"; do
    if [[ " $CHOICES " == *"\"$fn\""* ]]; then
        sed -i "s|^\([[:space:]]*\)#[[:space:]]*${fn}\$|\1${fn}|" "$SCRIPT"
    else
        sed -i "s|^\([[:space:]]*\)${fn}\$|\1# ${fn}|" "$SCRIPT"
    fi
done

echo "[gui.sh] ubuntu.sh function list adjusted to match selected policy."

# ---------------------------------------------------------------------------
# GRUB password (outside ubuntu.sh's own flow).
# ---------------------------------------------------------------------------
if [[ -n "$GRUB_PW" ]] && command -v grub-mkpasswd-pbkdf2 >/dev/null 2>&1; then
    HASH=$(printf '%s\n%s\n' "$GRUB_PW" "$GRUB_PW" | grub-mkpasswd-pbkdf2 | grep -o 'grub.pbkdf2.*')
    cat > /etc/grub.d/01_password <<EOF
#!/bin/sh
set -e
cat <<'GRUBEOF'
set superusers="admin"
password_pbkdf2 admin ${HASH}
GRUBEOF
EOF
    chmod 755 /etc/grub.d/01_password
    update-grub
    echo "[gui.sh] GRUB password configured."
fi
unset GRUB_PW

# ---------------------------------------------------------------------------
# Optional Tor block.
# ---------------------------------------------------------------------------
if [[ "$BLOCK_TOR" -eq 1 ]]; then
    apt-get -y purge tor >/dev/null 2>&1 || true
    if command -v ufw >/dev/null 2>&1; then
        ufw deny out 9001 >/dev/null 2>&1 || true
        ufw deny out 9030 >/dev/null 2>&1 || true
    fi
    echo "[gui.sh] Tor blocked (package removed, OR/dir ports denied outbound)."
fi

# ---------------------------------------------------------------------------
# Run the existing, unmodified hardening workflow with the now-updated cfg.
# ---------------------------------------------------------------------------
if whiptail --title "Ready" --yesno "Configuration complete. Run 'sudo bash ubuntu.sh' now?" 10 60; then
    cd "$REPO_DIR" && bash ubuntu.sh
else
    echo "You can run it later with: sudo bash $SCRIPT"
fi
