#!/bin/bash

source ../ubuntu.cfg

auditctlRuntime() {
  if which auditctl; then
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
  ls -l "$1" | awk '{print $1}' | grep -q 's'
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
  lineCount=$(cat $grepFile | wc -l)

  if [[ $lineCount -gt $maxLines ]]; then
    exit 1
  fi

  grep "$grepWord" "$grepFile"
}

sshdConfig() {
  sshd -T | grep -i "$1"
}

sysctlRuntime() {
  sysctl --all | grep -i "$1"
}
