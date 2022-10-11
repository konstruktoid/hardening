#!/bin/bash

set -u
set -o pipefail

CONTENT="0.1.64"
OVAL="5.10"
PROFILE="cis_level2_server"
REPORT_DATE="$(date +%y%m%d)"
REPORT_NAME="$(hostname -s)-${PROFILE}-report-${REPORT_DATE}.html"

sudo apt-get -y update
sudo apt install -y libopenscap8 unzip wget
wget "https://github.com/ComplianceAsCode/content/releases/download/v${CONTENT}/scap-security-guide-${CONTENT}-oval-${OVAL}.zip"
unzip "scap-security-guide-${CONTENT}-oval-${OVAL}.zip"
cd "scap-security-guide-${CONTENT}-oval-${OVAL}" || exit 1

if lsb_release -d | grep -qo 'Ubuntu\s20.04'; then
  sudo oscap xccdf eval --profile "xccdf_org.ssgproject.content_profile_${PROFILE}" --results-arf "results-${REPORT_DATE}.xml" --report "${REPORT_NAME}" ./ssg-ubuntu2004-ds-1.2.xml
fi

if [ -f "${REPORT_NAME}" ]; then
  sudo chown "$(id -u):$(id -g)" "${REPORT_NAME}"
  cp -v "${REPORT_NAME}" ~/"${REPORT_NAME}"
fi

cd .. || exit 1
