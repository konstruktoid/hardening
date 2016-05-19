#!/usr/bin/env bats

load test_helper

@test "Verify that ssh_host_dsa_key isn't present in $SSHDFILE " {
  run bash -c "grep ssh_host_dsa_key $SSHDFILE"
  [ "$status" -eq 1 ]
}

@test "Verify that X11Forwarding is disabled in $SSHDFILE " {
  run bash -c "grep '^X11Forwarding no$' $SSHDFILE"
  [ "$status" -eq 0 ]
}

@test "Verify LoginGraceTime 20 in $SSHDFILE " {
  run bash -c "grep '^LoginGraceTime 20$' $SSHDFILE"
  [ "$status" -eq 0 ]
}

@test "Verify PermitRootLogin no in $SSHDFILE " {
  run bash -c "grep '^PermitRootLogin no$' $SSHDFILE"
  [ "$status" -eq 0 ]
}

@test "Verify KeyRegenerationInterval 1800 in $SSHDFILE " {
  run bash -c "grep '^KeyRegenerationInterval 1800$' $SSHDFILE"
  [ "$status" -eq 0 ]
}

@test "Verify UsePrivilegeSeparation sandbox in $SSHDFILE " {
  run bash -c "grep '^UsePrivilegeSeparation sandbox$' $SSHDFILE"
  [ "$status" -eq 0 ]
}

@test "Verify LogLevel VERBOSE in $SSHDFILE " {
  run bash -c "grep '^LogLevel VERBOSE$' $SSHDFILE"
  [ "$status" -eq 0 ]
}

@test "Verify UseLogin no in $SSHDFILE " {
  run bash -c "grep '^UseLogin no$' $SSHDFILE"
  [ "$status" -eq 0 ]
}

@test "Verify banner in $SSHDFILE " {
  run bash -c "grep '^Banner /etc/issue.net$' $SSHDFILE"
  [ "$status" -eq 0 ]
}

@test "Verify sftp in $SSHDFILE " {
  run bash -c "grep '^Subsystem sftp /usr/lib/ssh/sftp-server -f AUTHPRIV -l INFO$' $SSHDFILE"
  [ "$status" -eq 0 ]
}

@test "Verify MaxAuthTries 4 in $SSHDFILE " {
  run bash -c "grep '^MaxAuthTries 4$' $SSHDFILE"
  [ "$status" -eq 0 ]
}

@test "Verify ClientAliveInterval 300 in $SSHDFILE " {
  run bash -c "grep '^ClientAliveInterval 300$' $SSHDFILE"
  [ "$status" -eq 0 ]
}

@test "Verify ClientAliveCountMax 0 in $SSHDFILE " {
  run bash -c "grep '^ClientAliveCountMax 0$' $SSHDFILE"
  [ "$status" -eq 0 ]
}

@test "Verify PermitUserEnvironment no in $SSHDFILE " {
  run bash -c "grep '^PermitUserEnvironment no$' $SSHDFILE"
  [ "$status" -eq 0 ]
}

@test "Verify KexAlgorithms no in $SSHDFILE " {
  run bash -c "grep '^KexAlgorithms curve25519-sha256@libssh.org' $SSHDFILE"
  [ "$status" -eq 0 ]
}

@test "Verify Ciphers in $SSHDFILE " {
  run bash -c "grep '^Ciphers chacha20-poly1305@openssh.com' $SSHDFILE"
  [ "$status" -eq 0 ]
}

@test "Verify Macs in $SSHDFILE " {
  run bash -c "grep '^Macs hmac-sha2-512-etm@openssh.com' $SSHDFILE"
  [ "$status" -eq 0 ]
}

@test "Verify MaxSessions 2 in $SSHDFILE " {
  run bash -c "grep '^MaxSessions 2$' $SSHDFILE"
  [ "$status" -eq 0 ]
}

@test "Verify UseDNS yes in $SSHDFILE " {
  run bash -c "grep '^UseDNS yes$' $SSHDFILE"
  [ "$status" -eq 0 ]
}
