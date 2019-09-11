#!/bin/sh -l

shellcheck -x -s bash -f gcc tests/*.bash tests/*.sh scripts/* misc/*.sh ./*.sh
