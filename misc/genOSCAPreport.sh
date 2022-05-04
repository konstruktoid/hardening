#!/bin/bash

set -u
set -o pipefail

if lsb_release -d | grep -qo 'Ubuntu\s20.04.4'; then
  CONTENT="0.1.61"
  OVAL="5.10"
  REPORT_DATE="$(date +%y%m%d)"
  REPORT_NAME="$(hostname -s)-cis_level2_server-report-${REPORT_DATE}.html"

  sudo apt-get -y update
  sudo apt install -y libopenscap8 unzip wget
  wget "https://github.com/ComplianceAsCode/content/releases/download/v${CONTENT}/scap-security-guide-${CONTENT}-oval-${OVAL}.zip"
  unzip "scap-security-guide-${CONTENT}-oval-${OVAL}.zip"
  cd "scap-security-guide-${CONTENT}-oval-${OVAL}" || exit 1
  sudo oscap xccdf eval --profile xccdf_org.ssgproject.content_profile_cis_level2_server --results-arf "results-${REPORT_DATE}.xml" --report "${REPORT_NAME}" ./ssg-ubuntu2004-ds-1.2.xml
  sudo chown vagrant:vagrant "${REPORT_NAME}"
  cp -v "${REPORT_NAME}" ~/"${REPORT_NAME}"
  cd .. || exit 1
fi
