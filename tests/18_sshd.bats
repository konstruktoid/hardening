#!/usr/bin/env bats

load test_helper

@test "Ensure OpenSSH ssh_host_dsa_key isn't used" {
  run sshdConfig ssh_host_dsa_key
  [ "$status" -eq 1 ]
}

@test "Verify OpenSSH X11Forwarding" {
  run sshdConfig '^X11Forwarding yes$'
  [ "$status" -eq 0 ]
}

@test "Verify OpenSSH LoginGraceTime" {
  run sshdConfig '^LoginGraceTime 20$'
  [ "$status" -eq 0 ]
}

@test "Verify OpenSSH PermitRootLogin" {
  run sshdConfig '^PermitRootLogin no$'
  [ "$status" -eq 0 ]
}

@test "Verify OpenSSH KeyRegenerationInterval" {
  run sshdConfig '^KeyRegenerationInterval 1800$'
  [ "$status" -eq 0 ]
}

@test "Verify OpenSSH UsePrivilegeSeparation" {
  run sshdConfig '^UsePrivilegeSeparation sandbox$'
  [ "$status" -eq 0 ]
}

@test "Verify OpenSSH LogLevel" {
  run sshdConfig '^LogLevel VERBOSE$'
  [ "$status" -eq 0 ]
}

@test "Verify OpenSSH UseLogin" {
  run sshdConfig '^UseLogin no$'
  [ "$status" -eq 0 ]
}

@test "Verify OpenSSH banner" {
  run sshdConfig '^Banner /etc/issue.net$'
  [ "$status" -eq 0 ]
}

@test "Verify OpenSSH sftp" {
  run sshdConfig '^Subsystem sftp /usr/lib/ssh/sftp-server -f AUTHPRIV -l INFO$'
  [ "$status" -eq 0 ]
}

@test "Verify OpenSSH MaxAuthTries" {
  run sshdConfig '^MaxAuthTries .$'
  [ "$status" -eq 0 ]
}

@test "Verify OpenSSH ClientAliveInterval" {
  run sshdConfig '^ClientAliveInterval 300$'
  [ "$status" -eq 0 ]
}

@test "Verify OpenSSH ClientAliveCountMax" {
  run sshdConfig '^ClientAliveCountMax 0$'
  [ "$status" -eq 0 ]
}

@test "Verify OpenSSH PermitUserEnvironment" {
  run sshdConfig '^PermitUserEnvironment no$'
  [ "$status" -eq 0 ]
}

@test "Verify OpenSSH KexAlgorithms" {
  run sshdConfig '^KexAlgorithms curve25519-sha256@libssh.org,ecdh-sha2-nistp521,ecdh-sha2-nistp384,ecdh-sha2-nistp256,diffie-hellman-group-exchange-sha256$'
  [ "$status" -eq 0 ]
}

@test "Verify OpenSSH Ciphers" {
  run sshdConfig '^Ciphers chacha20-poly1305@openssh.com,aes256-gcm@openssh.com,aes256-ctr$'
  [ "$status" -eq 0 ]
}

@test "Verify OpenSSH Macs" {
  run sshdConfig '^Macs hmac-sha2-512-etm@openssh.com,hmac-sha2-256-etm@openssh.com,hmac-sha2-512,hmac-sha2-256$'
  [ "$status" -eq 0 ]
}

@test "Verify OpenSSH MaxSessions" {
  run sshdConfig '^MaxSessions 2$'
  [ "$status" -eq 0 ]
}

@test "Verify OpenSSH UseDNS" {
  run sshdConfig '^UseDNS yes$'
  [ "$status" -eq 0 ]
}
