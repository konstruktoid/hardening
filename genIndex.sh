#!/bin/bash
echo "== Index"
while read -r index; do
  echo "$(echo "$index" | sed 's/=/./g' | sed 's/. .*/. /')link:README.adoc#$(echo "$index" |\
  cut -d' ' -f 2- | tr '[:upper:]' '[:lower:]' | tr -d '.,' | sed 's/ /-/g')[$(echo "$index" |\
  sed 's/=//g')]" | sed 's/\[ /\[/g'
done < <(grep '^==' README.adoc)
echo
