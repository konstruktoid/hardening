#!/bin/bash

set -u
set -o pipefail

CONTENT="0.1.65"
PROFILE=""
REPORT_DATE="$(date +%y%m%d)"
REPORT_NAME="$(hostname -s)-${PROFILE}-report-${REPORT_DATE}.html"

function download_content {
  wget "https://github.com/ComplianceAsCode/content/releases/download/v${CONTENT}/scap-security-guide-${CONTENT}.zip"
  unzip "scap-security-guide-${CONTENT}.zip"
  cd "scap-security-guide-${CONTENT}" || exit 1
}

if lsb_release -d | grep -qoE 'Ubuntu\s2(0|2).04'; then
  RELEASE="$(lsb_release -r | awk '{print $NF}' | tr -d '.')"

  sudo apt-get -y update
  sudo apt install -y libopenscap8 unzip wget
  download_content
  for PROFILE in cis_level2_server stig; do
    sudo oscap xccdf eval --fetch-remote-resources --profile "xccdf_org.ssgproject.content_profile_${PROFILE}" --results-arf "results-${REPORT_DATE}.xml" --report "${REPORT_NAME}" "./ssg-ubuntu${RELEASE}-ds-1.2.xml"
  done
fi

if grep -qo '^AlmaLinux\srelease\s8' /etc/redhat-release; then
  sudo dnf install -y openscap openscap-utils scap-security-guide

  for PROFILE in cis stig; do
    sudo oscap xccdf eval --fetch-remote-resources --profile "${PROFILE}" --results-arf "results-${REPORT_DATE}.xml" --report "${REPORT_NAME}" /usr/share/xml/scap/ssg/content/ssg-almalinux8-xccdf.xml
  done
fi

if [ -f "${REPORT_NAME}" ]; then
  sudo chown "$(id -u):$(id -g)" "${REPORT_NAME}"
  cp -v "${REPORT_NAME}" ~/"${REPORT_NAME}"
fi

cd .. || exit 1
