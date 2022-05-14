#!/bin/bash
set -eux -o pipefail

sudo apt-get clean
sudo apt-get autoclean
sudo apt-get -y update
sudo apt-get -y install git net-tools procps --no-install-recommends

cd /tmp || exit 1

git clone https://github.com/konstruktoid/hardening.git

cd ./hardening || exit 1

sed -i "s/CHANGEME=''/CHANGEME='$(date +%s)'/" ./ubuntu.cfg
sed -i "s/VERBOSE='/VERBOSE='Y/" ./ubuntu.cfg

# Don't run aide by default
sed -i "s/  f_aide/# f_aide/g" ubuntu.sh

# This is because of snapd
# https://github.com/konstruktoid/hardening/issues/123
sed -i "s/  f_apport/# f_apport/g" ubuntu.sh
sed -i "s/apport\* //g" scripts/packages
sed -i "s/popularity-contest //g" scripts/packages
sed -i "s/rsync //g" scripts/packages

chmod a+x ./ubuntu.sh
sudo bash ./ubuntu.sh

cd /tmp || exit 1

rm -rvf ./hardening

# AWS Session Manager
sudo useradd --user-group ssm-user
echo "ssm-user ALL=(ALL) NOPASSWD:ALL" | sudo tee -a /etc/sudoers.d/ssm-user

# Manage access via AWS by default
sudo ufw disable
sudo snap restart amazon-ssm-agent
