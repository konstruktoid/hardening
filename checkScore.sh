#!/bin/sh
if command -v apt-get; then
  PKG="apt-get"
elif command -v yum; then
  PKG="yum"
else
  exit 1
fi

cd ~ || exit 1

sudo "$PKG" -y install git

git clone https://github.com/CISOFy/lynis

sudo chown -R root:root lynis
sudo chmod a+rx lynis
cd lynis || exit 1

LANG=C sudo ./lynis audit system
sudo cp '/var/log/lynis-report.dat' ~/
sudo chown vagrant:vagrant ~/lynis-report.dat
