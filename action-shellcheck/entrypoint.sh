#!/bin/sh -l

sh -c "$(command -v shellcheck) -x -s bash -f gcc tests/*.bash scripts/* misc/*.sh ubuntu.sh"
