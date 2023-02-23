#!/bin/bash

if ! command -v bats 1>/dev/null; then
  echo "bats isn't installed. Exiting."
  exit 1
fi

TESTS="$(grep -Ro '@test' ./*.bats | wc -l)"
HOST="$(hostname -s)"

sudo bats . | tee ./"${HOST}-bats.log" 1>/dev/null

{
  echo "= Test results - $(LANG=C date --utc)"
  echo ":icons: font"
  echo "Number of tests: ${TESTS}"
  echo
  echo "The score is calculated using 100-(100*FAILED_TESTS/TESTS)."
  echo
  echo "== System information"
  echo "----"
  echo "Hostname: $(hostname -f)"
  echo "Kernel: $(uname -sri)"
  echo "Release: $(lsb_release -sd)"
  echo "----"

  echo
  echo "== ${HOST}"

  echo "----"
  while read -r f; do
    if test -s "${f}"; then
      FAILED_TESTS="$(grep -c '^not ok' "${f}")"
      echo "Failed number of tests: ${FAILED_TESTS}"
    else
      echo "$f is empty, a test stage failed."
    fi
  done < <(find ./ -name "*${HOST}*bats.log" -type f)
  echo "----"

  echo
  echo "=== Failed tests:"
  echo "----"
  grep -shE '^not ok' ./*"${HOST}"*bats.log | sort -k3n | uniq
  echo "----"

  echo
  echo "=== Score: $((100-(100*FAILED_TESTS/TESTS)))"
} > "TESTRESULTS-${HOST}".adoc

if command -v dos2unix; then
  dos2unix TESTRESULTS-"${HOST}".adoc
fi

if test -s ./"${HOST}-bats.log"; then
  rm ./"${HOST}-bats.log"
fi
