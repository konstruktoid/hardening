#!/bin/bash
set -euf -o pipefail

TFILE="$(mktemp)"

readonly TFILE

curl -sSL https://raw.githubusercontent.com/konstruktoid/hardening/master/misc/suid.list |\
  grep -v '^#' > "${TFILE}"

grep -vE '^#|^$' /etc/shells | while read -r S; do
  basename "$S" >> "${TFILE}"
done

curl -sSL 'https://gtfobins.github.io/#+suid' | grep -o 'bin-name.*</a' |\
  grep -o '>.*<' | tr -d '<>' >> "${TFILE}"

echo '# https://gtfobins.github.io/#+suid
# https://raw.githubusercontent.com/konstruktoid/hardening/master/misc/suid.list
' > suid.list

grep -vE '^#|^$' "${TFILE}" | sort | uniq >> suid.list

rm "${TFILE}"
