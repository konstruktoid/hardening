#!/bin/sh

curl -sSL https://www.ncsc.gov.uk/static-assets/documents/PwnedPasswordsTop100k.txt > ncschabp.list
curl -sSL https://raw.githubusercontent.com/dropbox/zxcvbn/master/data/passwords.txt | awk '{print $1}' > zxcvbn.list
grep -v '^#' ./ncschabp.list ./zxcvbn.list | sed 's/.*://g' |\
  grep -Ei '^[a-z]|^[0-9]' | sort | uniq > passwords.list
