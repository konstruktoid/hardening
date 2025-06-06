#!/bin/bash

set -u -o pipefail

CONTENT="0.1.77"

function download_content {
  if ! [ -f "scap-security-guide-${CONTENT}.zip" ]; then
    wget -nc "https://github.com/ComplianceAsCode/content/releases/download/v${CONTENT}/scap-security-guide-${CONTENT}.zip"
    unzip -n "scap-security-guide-${CONTENT}.zip"
  fi
}

function generate_report () {
  PROFILE="$1"
  REPORT_DATE="$(date +%y%m%d)"
  REPORT_NAME="$(hostname -s)-${PROFILE}-report-${REPORT_DATE}.html"

  if lsb_release -d | grep -qoE 'Ubuntu\s2(0|2|4).04'; then
    if [ "${PROFILE}" = "cis" ]; then
      PROFILE="cis_level2_server"
    fi

    RELEASE="$(lsb_release -r | awk '{print $NF}' | tr -d '.')"

    sudo apt-get -y update
    if lsb_release -d | grep -qoE 'Ubuntu\s2(0|2).04'; then
      sudo apt-get install -y libopenscap8 unzip wget
    else
      sudo apt-get install -y libopenscap25t64 openscap-common openscap-scanner unzip wget
    fi
    download_content
    cd "scap-security-guide-${CONTENT}" || exit 1
    sudo oscap xccdf eval --fetch-remote-resources --profile "xccdf_org.ssgproject.content_profile_${PROFILE}" --results-arf "results-${REPORT_DATE}.xml" --report "${REPORT_NAME}" "./ssg-ubuntu${RELEASE}-ds.xml"
  fi

  if grep -qo '^AlmaLinux\s' /etc/redhat-release; then
    MAJOR_VERSION=$(grep AlmaLinux /etc/redhat-release | awk '{split($3, a, "."); print a[1]}')

    if [[ $MAJOR_VERSION -eq 8 ]]; then
      SCAP_FILE="ssg-almalinux8-xccdf.xml"
    else
      SCAP_FILE="ssg-almalinux9-ds.xml"
    fi

    sudo dnf install -y openscap openscap-utils scap-security-guide
    sudo oscap xccdf eval --fetch-remote-resources --profile "${PROFILE}" --results-arf "results-${REPORT_DATE}.xml" --report "${REPORT_NAME}" "/usr/share/xml/scap/ssg/content/${SCAP_FILE}"
  fi

  if [ -f "${REPORT_NAME}" ]; then
    sudo chown "$(id -u):$(id -g)" "${REPORT_NAME}"
    cp -v "${REPORT_NAME}" ~/"${REPORT_NAME}"
  fi

  cd .. || exit 1
}

generate_report "cis"
generate_report "cui"
generate_report "stig"
