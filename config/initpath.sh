#!/bin/bash

if [[ $EUID -eq 0 ]]; then
  export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/snap/bin
else
  export PATH=/usr/local/bin:/usr/sbin:/usr/bin:/bin:/snap/bin
fi
