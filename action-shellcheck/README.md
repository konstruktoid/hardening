= ShellCheck action for the Hardening repository

Using [koalaman/shellcheck-alpine](https://hub.docker.com/r/koalaman/shellcheck-alpine)
to lint the shell code.

== Disabled tests

```sh
scripts/01_pre: # shellcheck disable=2034
scripts/07_timesyncd: # shellcheck disable=2086
scripts/07_timesyncd: # shellcheck disable=2143
scripts/07_timesyncd: # shellcheck disable=2243
scripts/07_timesyncd: # shellcheck disable=2244
scripts/41_compilers: # shellcheck disable=2046
scripts/41_compilers: # shellcheck disable=2046
tests/runHostTests.sh: # shellcheck disable=SC2024
tests/test_helper.bash: # shellcheck disable=1091
ubuntu.sh: # shellcheck disable=2009
ubuntu.sh: # shellcheck disable=2034
ubuntu.sh: # shellcheck disable=1090
```

== Entrypoint command

```sh
#!/bin/sh -l

shellcheck -x -s bash -f gcc tests/*.bash tests/*.sh scripts/* misc/*.sh ./*.sh
```
