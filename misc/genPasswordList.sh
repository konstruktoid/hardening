#!/bin/bash

set -eux -o pipefail

TMPFILE="$(mktemp)"

curl -sSL https://www.ncsc.gov.uk/static-assets/documents/PwnedPasswordsTop100k.txt > ncschabp.list
curl -sSL https://raw.githubusercontent.com/dropbox/zxcvbn/master/data/passwords.txt | awk '{print $1}' > zxcvbn.list
curl -sSL https://raw.githubusercontent.com/danielmiessler/SecLists/master/Passwords/Leaked-Databases/singles.org.txt > leaked.list
curl -sSL https://raw.githubusercontent.com/danielmiessler/SecLists/master/Passwords/Leaked-Databases/Lizard-Squad.txt >> leaked.list
curl -sSL https://raw.githubusercontent.com/danielmiessler/SecLists/master/Passwords/Leaked-Databases/NordVPN.txt >> leaked.list
curl -sSL https://raw.githubusercontent.com/konstruktoid/honeypot-passwords/main/cowrie.list > cowrie.list

grep -v '^$' cowrie.list >> "${TMPFILE}"

grep -vE '^$|^#' ./leaked.list ./ncschabp.list ./zxcvbn.list | sed 's/.*://g' |\
  grep -Ei '^[a-z]|^[0-9]' >> "${TMPFILE}"

if [ -x "$(which dos2unix)" ]; then
  dos2unix ./*.list "${TMPFILE}"
fi

grep -v '^$' "${TMPFILE}" | sort | uniq > passwords.list

rm "${TMPFILE}"
