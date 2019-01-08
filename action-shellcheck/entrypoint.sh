#!/bin/sh -l

shellcheck -x -s bash -f gcc tests/*.bash scripts/* misc/*.sh ubuntu.sh
