#!/bin/bash

set -u
set -o pipefail

CONTENT="0.1.71"

function download_content {
  if ! [ -f "scap-security-guide-${CONTENT}.zip" ]; then
    wget -nc "https://github.com/ComplianceAsCode/content/releases/download/v${CONTENT}/scap-security-guide-${CONTENT}.zip"
  fi
  unzip -n "scap-security-guide-${CONTENT}.zip"
}

function generate_report () {
  PROFILE="$1"
  REPORT_DATE="$(date +%y%m%d)"
  REPORT_NAME="$(hostname -s)-${PROFILE}-report-${REPORT_DATE}.html"

  if lsb_release -d | grep -qoE 'Ubuntu\s2(0|2).04'; then
    if [ "${PROFILE}" = "cis" ]; then
      PROFILE="cis_level2_server"
    fi

    RELEASE="$(lsb_release -r | awk '{print $NF}' | tr -d '.')"

    sudo apt-get -y update
    sudo apt install -y libopenscap8 unzip wget
    download_content
    cd "scap-security-guide-${CONTENT}" || exit 1
    sudo oscap xccdf eval --fetch-remote-resources --profile "xccdf_org.ssgproject.content_profile_${PROFILE}" --results-arf "results-${REPORT_DATE}.xml" --report "${REPORT_NAME}" "./ssg-ubuntu${RELEASE}-ds-1.2.xml"
  fi

  if grep -qo '^AlmaLinux\srelease\s8' /etc/redhat-release; then
    sudo dnf install -y openscap openscap-utils scap-security-guide
    sudo oscap xccdf eval --fetch-remote-resources --profile "${PROFILE}" --results-arf "results-${REPORT_DATE}.xml" --report "${REPORT_NAME}" /usr/share/xml/scap/ssg/content/ssg-almalinux8-xccdf.xml
  fi

  if [ -f "${REPORT_NAME}" ]; then
    sudo chown "$(id -u):$(id -g)" "${REPORT_NAME}"
    cp -v "${REPORT_NAME}" ~/"${REPORT_NAME}"
  fi
}

generate_report "cis"
generate_report "stig"

cd .. || exit 1
