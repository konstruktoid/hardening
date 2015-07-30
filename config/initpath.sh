#!/bin/bash

if [[ $EUID -eq 0 ]];
  then
    export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
  else
    export PATH=/usr/local/bin:/usr/bin:/bin
fi
