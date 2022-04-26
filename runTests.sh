#!/bin/bash

set -u -o pipefail

if ! command -v shellcheck; then
  exit 1
fi

if ! shellcheck -x -s bash -f gcc tests/*.bash tests/*.sh scripts/* misc/*.sh ./*.sh; then
  exit 1
fi

if ! command -v vagrant; then
  exit 1
fi

if ! vagrant validate Vagrantfile; then
  exit 1
fi

find ./ -name '*.log' -exec rm {} \;

vagrant box update --insecure
vagrant destroy --force

for d in $(grep config.vm.define Vagrantfile | grep -o '".*"' | tr -d '"');
  do rm -v "/tmp/${d}_disk01.vdi"
done

grep config.vm.define Vagrantfile | grep -v '^#' | grep -o '".*"' | tr -d '"' |\
  while read -r v; do
    vagrant up "${v}"
done

wait

grep config.vm.define Vagrantfile | grep -v '^#' | grep -o '".*"' | tr -d '"' |\
  while read -r v; do
    vagrant reload "${v}"
done

wait

for VM in $(vagrant status | grep -iE 'running.*virtualbox' | awk '{print $1}'); do
  vagrant ssh "${VM}" -c 'cp /vagrant/checkScore.sh ~/'
  vagrant ssh "${VM}" -c 'cp /vagrant/misc/genOSCAPreport.sh ~/'
  vagrant ssh "${VM}" -c 'sudo apt-get -y update && sudo apt-get -y install bats net-tools shellcheck --no-install-recommends'
  vagrant ssh "${VM}" -c 'cp -R /vagrant ~/hardening && sed -i.bak -e "s/^AUTOFILL=.*/AUTOFILL='\''Y'\''/" -e "s/^CHANGEME=.*/CHANGEME='\''changed'\''/" ~/hardening/ubuntu.cfg && cd ~/hardening && sudo bash ubuntu.sh && sudo reboot'
done

wait

for VM in $(vagrant status | grep -iE 'running.*virtualbox' | awk '{print $1}'); do
  while ! vagrant ssh "$VM" -c 'id'; do
    echo "Waiting for $VM."
    sleep 10
  done
  vagrant ssh "${VM}" -c 'bash ~/genOSCAPreport.sh'
  vagrant ssh "${VM}" -c 'cd ~/hardening/tests && sudo bats . >> ~/bats.log'
  vagrant ssh "${VM}" -c 'cat ~/bats.log' | grep 'not ok'  > "hardening-$VM-$(date +%y%m%d)-bats.log"
  vagrant ssh "${VM}" -c 'sh ~/checkScore.sh || exit 1 && cat ~/lynis-report.dat' > "hardening-$VM-$(date +%y%m%d)-lynis.log"
  vagrant scp "${VM}:*.html" "."
done

wait

{
  TESTS="$(grep -Ro '@test' tests/*.bats | wc -l)"

  echo "= Vagrant Ubuntu Test results - $(LANG=C date --utc)"
  echo ":icons: font"
  echo "Number of tests: ${TESTS}"
  echo
  echo "The score is calculated using \`100-(100*FAILED_TESTS/TESTS)\`."
  echo
  echo "NOTE: This is a quick test script using Vagrant boxes and some functions may fail resulting in incorrect output or score. Always verify using systems similar to those used by your organization."
  echo
  echo "== System information"
  echo "----"
  vagrant --version
  echo "VirtualBox $(vboxmanage --version)"

  for box in $(grep 'vm.box' Vagrantfile | grep -o '".*"$' | tr -d '"'); do
    vagrant box list | grep -i "${box}" | tail -n1 | sed 's/64.*(/86 \(/g'
  done
  echo "----"

  # Modified VMs
  for VM in $(vagrant status | grep -iE 'running.*virtualbox' | awk '{print $1}'); do
    if [ -z "${VM}" ]; then
      echo "We dont have any VMs, exiting."
      exit 1
    fi

    echo
    echo "== Ubuntu release: ${VM}"

    echo "----"
    while read -r f; do
      if test -s "${f}"; then
        FAILED_TESTS="$(grep -c '^not ok' "${f}")"
        echo "Failed number of tests: ${FAILED_TESTS}"
        STAGE_FAIL=0
      else
        echo "$f is empty, a test stage failed."
        FAILED_TESTS=100
        STAGE_FAIL=1
      fi
    done < <(find ./ -name "*${VM}*bats.log" -type f)
    echo "----"

    echo
    echo "=== Failed tests:"
    echo "----"
    if [ "${STAGE_FAIL}" == 0 ]; then
      grep -shE '^not ok' ./*"${VM}"*bats.log | sort -k3n | uniq
    else
      echo "N/A."
    fi
    echo "----"


    echo "=== Lynis score:"
    echo "----"
    find ./ -name "*${VM}*lynis.log" -type f | while read -r f; do
      if test -s "${f}"; then
        echo
        grep -E 'hardening_index|os_version' "${f}"
      else
        echo "$f is empty, a test stage failed."
      fi
    done
    echo "----"

    echo
    echo "=== Lynis warnings and suggestions:"
    echo "----"
    grep -shE '^warning|^suggestion' ./*"${VM}"*lynis.log | sort -r | uniq
    echo "----"

    echo
    echo "=== Score: $((100-(100*FAILED_TESTS/TESTS)))"
  done
} > TESTRESULTS.adoc

if command -v dos2unix; then
  dos2unix TESTRESULTS.adoc
fi
