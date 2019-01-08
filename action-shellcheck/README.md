= ShellCheck action for the Hardening repository

Using [koalaman/shellcheck-alpine](https://hub.docker.com/r/koalaman/shellcheck-alpine)
too lint the shell code.

== Disabled tests

```sh
misc/systemd_scan.sh: # shellcheck disable=2001
scripts/07_timesyncd: # shellcheck disable=2086
scripts/07_timesyncd: # shellcheck disable=2143
scripts/07_timesyncd: # shellcheck disable=2243
scripts/07_timesyncd: # shellcheck disable=2244
scripts/41_compilers: # shellcheck disable=2046
tests/test_helper.bash: # shellcheck disable=1091
ubuntu.sh: # shellcheck disable=1090
ubuntu.sh: # shellcheck disable=2009
```

== Entrypoint command

```sh
shellcheck -x -s bash -f gcc tests/*.bash scripts/* misc/*.sh ubuntu.sh
```
