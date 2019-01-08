#!/bin/bash

if ! command -v shellcheck; then
  exit 1
fi

if ! shellcheck -x -s bash -f gcc tests/*.bash scripts/* misc/*.sh ubuntu.sh; then
  exit 1
fi

if ! command -v vagrant; then
  exit 1
fi

find ./ -name '*.log' -exec rm {} \;

vagrant box update --insecure
vagrant destroy --force

grep config.vm.define Vagrantfile | grep -o '".*"' | tr -d '"' | while read -r v; do
  vagrant up "$v"
done

wait

for VM in $(vagrant status | grep virtualbox | awk '{print $1}' | grep -v 'basic'); do
  vagrant ssh "$VM" -c 'cp /vagrant/checkScore.sh ~/'
  vagrant ssh "$VM" -c 'cp -R /vagrant ~/hardening && sed -i.bak -e "s/^AUTOFILL=.*/AUTOFILL='\''Y'\''/" -e "s/^CHANGEME=.*/CHANGEME='\''changed'\''/" ~/hardening/ubuntu.cfg && cd ~/hardening && sudo bash ubuntu.sh && sudo reboot'
done

wait

for VM in $(vagrant status | grep virtualbox | awk '{print $1}' | grep -v 'basic'); do
  vagrant ssh "$VM" -c 'sudo apt-get -y update && sudo apt-get -y install bats && cd ~/hardening/tests && sudo bats . >> ~/bats.log'
  wait
  vagrant ssh "$VM" -c 'cat ~/bats.log' | grep 'not ok'  > "hardening-$VM-$(date +%y%m%d)-bats.log"
  vagrant ssh "$VM" -c 'sh ~/checkScore.sh || exit 1 && cat ~/lynis-report.dat' > "hardening-$VM-$(date +%y%m%d)-lynis.log"
done

wait

for VM in $(vagrant status | grep virtualbox | awk '{print $1}' | grep 'basic'); do
  vagrant ssh "$VM" -c 'cp -R /vagrant ~/hardening'
  vagrant ssh "$VM" -c 'cp /vagrant/checkScore.sh ~/'
  vagrant ssh "$VM" -c 'sudo apt-get -y update && sudo apt-get -y install bats && cd ~/hardening/tests && sudo bats . >> ~/bats.log'
  wait
  vagrant ssh "$VM" -c 'cat ~/bats.log' | grep 'not ok'  > "hardening-$VM-$(date +%y%m%d)-bats.log"
  vagrant ssh "$VM" -c 'sh ~/checkScore.sh || exit 1 && cat ~/lynis-report.dat' > "hardening-$VM-$(date +%y%m%d)-lynis.log"
done

wait

echo
echo "=== Test results"

find ./ -name 'hardening-*-bats.log' -type f | while read -r f; do
  if test -s "$f"; then
    echo "$f: $(grep -c '^not ok' "$f")"
  else
    echo "$f is empty, a test stage failed."
  fi
done

find ./ -name 'hardening-*-lynis.log' -type f | while read -r f; do
  if test -s "$f"; then
    echo "$f: $(grep -E 'hardening_index|os_version' "$f")"
  else
    echo "$f is empty, a test stage failed."
  fi
done

echo
grep -shE '^not ok' hardening-{bionic,cosmic,disco}-*-bats.log | sort -k3n | uniq

echo
grep -shE 'warning|suggestion' hardening-{bionic,cosmic,disco}-*-lynis.log | sort -r | uniq
