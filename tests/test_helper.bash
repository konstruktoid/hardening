#!/bin/bash

# shellcheck disable=1091
source ../ubuntu.cfg

auditctlRuntime() {
  if command -v auditctl; then
    auditctl -l | grep -E "$1"
  else
    exit 1
  fi
}

fragmentPath() {
  if [ -f "$(systemctl show -p FragmentPath "$1" | sed 's/.*=//')" ]; then
    systemctl show -p FragmentPath "$1" | sed 's/.*=//'
  else
    exit 1
  fi
}

gotSGid() {
  bin="$(command -v "$1")"
  if [ -x "$bin" ]; then
    if [ "$(stat -c %a "$bin")" -le 777 ]; then
      exit 0
    else
      exit 1
    fi
  else
    exit 0
  fi
}

isMasked() {
  isMasked=$(systemctl is-enabled "$1")
  if [[ "$isMasked" = "masked" ]]; then
    exit 0
  else
    exit 1
  fi
}

isLocked() {
  isLocked=$(passwd -S "$1" | awk '{print $2}')
  if [[ "$isLocked" = "L" ]]; then
    exit 0
  else
    exit 1
  fi
}

oneEntry() {
  grepWord="$1"
  grepFile="$2"
  maxLines="$3"
  lineCount=$(wc -l "$grepFile")

  if [[ $lineCount -gt $maxLines ]]; then
    exit 1
  fi

  grep "$grepWord" "$grepFile"
}

sshdConfig() {
  sshd -T | grep -iE "$1"
}

sysctlRuntime() {
  sysctl --all | grep -i "$1"
}

moduliSize() {
 if awk '{print $5}' /etc/ssh/moduli | grep -E -q '^...$|^1...$|^2...$'; then
   exit 1
 else
   exit 0
 fi
}

packageInstalled() {
  dpkg -l | awk '{print $1, $2}' | grep "^ii.* $1"
}
