#!/bin/bash
# Check systemd .service configuration
# https://github.com/konstruktoid/hardening/blob/master/systemd.adoc

service_list_file="$(mktemp)"
all_services="$(systemctl -a | grep -E '.*\.service.*loaded.*active.*running' |\
  grep -v '@' | awk '{print $1}')"

if [ -z "$1" ]; then
  echo "$(echo "$all_services" | wc -l) services found."
  echo "$all_services" > "$service_list_file"
else
  echo "$1" > "$service_list_file"
fi

while read -r service_name; do
  passed_settings=0
  failed_settings=0

  service_fragmentpath="$(systemctl show -p FragmentPath "$service_name" |\
    sed 's/FragmentPath=//g' | awk '{print $NF}')"

  if [ -f "$service_fragmentpath" ]; then
    echo "$(tput bold)[I] $service_name$(tput sgr0)"
    echo "    [I] $service_fragmentpath used."

    service_configuration_option() {
      # shellcheck disable=2001
      clean_option="$(echo "$1" | sed 's/=.*//g')"
      if grep -q -E "$1" "$service_fragmentpath"; then
        echo "    [P] $clean_option is set."
        passed_settings=$((passed_settings +1))
      else
        echo "    $(tput setaf 1)[F] $clean_option is not set.$(tput sgr0)"
        failed_settings=$((failed_settings +1))
      fi
    }

    conf_options="User=...
    Group=...
    CapabilityBoundingSet=...
    PrivateTmp=(true|yes)
    PrivateDevices=(true|yes)
    NoNewPrivileges=(true|yes)
    SELinuxContext=
    AppArmorProfile=
    LimitNOFILE=
    LimitNPROC=
    DynamicUser="

    while read -r option; do
      service_configuration_option "$option"
    done <<< "$conf_options"

    if grep -q 'ProtectSystem=full' "$service_fragmentpath"; then
      echo "    [P] ProtectSystem=full is set."
      passed_settings=$((passed_settings +1))
    elif grep -q 'ProtectSystem=true' "$service_fragmentpath"; then
      echo "    [P] ProtectSystem=true is set."
      passed_settings=$((passed_settings +1))
    else
      echo "    $(tput setaf 1)[F] ProtectSystem is not set.$(tput sgr0)"
      failed_settings=$((failed_settings +1))
    fi

    if grep -q 'ProtectHome=true' "$service_fragmentpath"; then
      echo "    [P] ProtectHome=true is set."
      passed_settings=$((passed_settings +1))
    elif grep -q 'ProtectHome=read-only' "$service_fragmentpath"; then
      echo "    [P] ProtectHome=read-only is set."
      passed_settings=$((passed_settings +1))
    else
      echo "    $(tput setaf 1)[F] ProtectHome is not set.$(tput sgr0)"
      failed_settings=$((failed_settings +1))
    fi

      echo "    $(tput bold)[I] $failed_settings failures, $passed_settings passed.$(tput sgr0)"

  else
    echo "[I] $service_name"
    echo "    [F] $service_fragmentpath does not exist."
  fi
done < "$service_list_file"

rm "$service_list_file"
