#!/bin/bash

set -eux -o pipefail

TMPFILE="$(mktemp)"

curl -sSL https://www.ncsc.gov.uk/static-assets/documents/PwnedPasswordsTop100k.txt > ncschabp.list
curl -sSL https://raw.githubusercontent.com/dropbox/zxcvbn/master/data/passwords.txt | awk '{print $1}' > zxcvbn.list
curl -sSL https://raw.githubusercontent.com/danielmiessler/SecLists/master/Passwords/Leaked-Databases/singles.org.txt > leaked.list
curl -sSL https://raw.githubusercontent.com/danielmiessler/SecLists/master/Passwords/Leaked-Databases/Lizard-Squad.txt >> leaked.list
curl -sSL https://raw.githubusercontent.com/danielmiessler/SecLists/master/Passwords/Leaked-Databases/NordVPN.txt >> leaked.list
curl -sSL https://raw.githubusercontent.com/konstruktoid/honeypot-passwords/main/cowrie.list > cowrie.list
curl -sSL https://raw.githubusercontent.com/konstruktoid/hardening/master/misc/passwords.list >> "${TMPFILE}"

{
  grep -v '^$' cowrie.list >> "${TMPFILE}"
  grep -hvE '^$' ./*.list | grep -Ei '^[a-z]|^[0-9]'
} >> "${TMPFILE}"

grep -v '^$' "${TMPFILE}" | strings | sort | uniq > passwords.list

if [ -x "$(which dos2unix)" ]; then
  dos2unix ./*.list
fi

rm "${TMPFILE}"
