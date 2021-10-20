#!/usr/bin/env bats

load test_helper

@test "Ensure OpenSSH ssh_host_dsa_key is not used" {
  run sshdConfig ssh_host_dsa_key
  [ "$status" -eq 1 ]
}

@test "Verify OpenSSH UsePrivilegeSeparation (Deprecated)" {
  run sshdConfig UsePrivilegeSeparation
  [ "$status" -eq 1 ]
}

@test "Verify OpenSSH Protocol (Deprecated)" {
  run sshdConfig Protocol
  [ "$status" -eq 1 ]
}

@test "Verify OpenSSH RhostsRSAAuthentication (Deprecated)" {
  run sshdConfig RhostsRSAAuthentication
  [ "$status" -eq 1 ]
}

@test "Verify OpenSSH port $SSH_PORT" {
  run bash -c "sshd -T | grep -i \"^port $SSH_PORT$\""
  [ "$status" -eq 0 ]
}

@test "Verify OpenSSH User and Groups access limits" {
  run bash -c "sshd -T | grep -i -E 'allowgroups|allowusers|denygroups|denyusers'"
  [ "$status" -eq 0 ]
}

@test "Verify OpenSSH IgnoreRhosts" {
  run sshdConfig '^IgnoreRhosts yes$'
  [ "$status" -eq 0 ]
}

@test "Verify OpenSSH Compression" {
  run sshdConfig '^Compression no$'
  [ "$status" -eq 0 ]
}

@test "Verify OpenSSH KerberosAuthentication" {
  run sshdConfig '^KerberosAuthentication no$'
  [ "$status" -eq 0 ]
}

@test "Verify OpenSSH StrictModes" {
  run sshdConfig '^StrictModes yes$'
  [ "$status" -eq 0 ]
}

@test "Verify OpenSSH GSSAPIAuthentication" {
  run sshdConfig '^GSSAPIAuthentication no$'
  [ "$status" -eq 0 ]
}

@test "Verify OpenSSH X11Forwarding" {
  run sshdConfig '^X11Forwarding no$'
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
  run sshdConfig '^KeyRegenerationInterval.*$'
  [ "$status" -eq 1 ]
}

@test "Verify OpenSSH LogLevel" {
  run sshdConfig '^LogLevel VERBOSE$'
  [ "$status" -eq 0 ]
}

@test "Verify OpenSSH banner" {
  run sshdConfig '^Banner /etc/issue.net$'
  [ "$status" -eq 0 ]
}

@test "Verify OpenSSH sftp" {
  run sshdConfig '^Subsystem sftp internal-sftp$'
  [ "$status" -eq 0 ]
}

@test "Verify OpenSSH MaxAuthTries" {
  run sshdConfig '^MaxAuthTries .$'
  [ "$status" -eq 0 ]
}

@test "Verify OpenSSH ClientAliveInterval" {
  run sshdConfig '^ClientAliveInterval 200$'
  [ "$status" -eq 0 ]
}

@test "Verify OpenSSH ClientAliveCountMax" {
  run sshdConfig '^ClientAliveCountMax 3$'
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
  run sshdConfig '^MaxSessions 3$'
  [ "$status" -eq 0 ]
}

@test "Verify OpenSSH UseDNS" {
  run sshdConfig '^UseDNS no$'
  [ "$status" -eq 0 ]
}

@test "Verify OpenSSH PrintLastLog" {
  run sshdConfig '^PrintLastLog yes$'
  [ "$status" -eq 0 ]
}

@test "Verify OpenSSH IgnoreUserKnownHosts" {
  run sshdConfig '^IgnoreUserKnownHosts yes$'
  [ "$status" -eq 0 ]
}

@test "Verify OpenSSH PermitEmptyPasswords" {
  run sshdConfig '^PermitEmptyPasswords no$'
  [ "$status" -eq 0 ]
}

@test "Verify OpenSSH MaxStartups" {
  run sshdConfig '^MaxStartups 10:30:60$'
  [ "$status" -eq 0 ]
}

@test "Verify OpenSSH HostbasedAuthentication" {
  run sshdConfig '^HostbasedAuthentication no$'
  [ "$status" -eq 0 ]
}

@test "Verify OpenSSH RekeyLimit" {
  run sshdConfig '^RekeyLimit [0-9]{5,9} 3600$'
  [ "$status" -eq 0 ]
}

@test "Verify OpenSSH AllowTcpForwarding" {
  run sshdConfig '^AllowTcpForwarding no$'
  [ "$status" -eq 0 ]
}

@test "Verify OpenSSH AllowAgentForwarding" {
  run sshdConfig '^AllowAgentForwarding no$'
  [ "$status" -eq 0 ]
}

@test "Verify OpenSSH TCPKeepAlive" {
  run sshdConfig '^TCPKeepAlive no$'
  [ "$status" -eq 0 ]
}

@test "Verify moduli sizes" {
  run moduliSize
  [ "$status" -eq 0 ]
}

@test "Verify OpenSSH Client HashKnownHosts" {
  run bash -c "grep '^\s.*HashKnownHosts yes$' /etc/ssh/ssh_config"
  [ "$status" -eq 0 ]
}

@test "Verify OpenSSH Client Ciphers" {
  run bash -c "grep '^\s.*Ciphers chacha20-poly1305@openssh.com,aes256-gcm@openssh.com,aes256-ctr$' /etc/ssh/ssh_config"
  [ "$status" -eq 0 ]
}

@test "Verify OpenSSH Client Macs" {
  run bash -c "grep '^\s.*MACs hmac-sha2-512-etm@openssh.com,hmac-sha2-256-etm@openssh.com,hmac-sha2-512,hmac-sha2-256$' /etc/ssh/ssh_config"
  [ "$status" -eq 0 ]
}

@test "Ensure OpenSSH MAC hmac-md5 is not used" {
  run sshdConfig 'hmac-md5'
  [ "$status" -eq 1 ]
}

@test "Ensure OpenSSH MAC hmac-md5-96 is not used" {
  run sshdConfig 'hmac-md5-96'
  [ "$status" -eq 1 ]
}

@test "Ensure OpenSSH MAC hmac-ripemd160 is not used" {
  run sshdConfig 'hmac-ripemd160'
  [ "$status" -eq 1 ]
}

@test "Ensure OpenSSH MAC hmac-sha1 is not used" {
  run sshdConfig 'hmac-sha1'
  [ "$status" -eq 1 ]
}

@test "Ensure OpenSSH MAC hmac-sha1-96 is not used" {
  run sshdConfig 'hmac-sha1-96'
  [ "$status" -eq 1 ]
}

@test "Ensure OpenSSH MAC umac-64@openssh.com is not used" {
  run sshdConfig 'umac-64@openssh.com'
  [ "$status" -eq 1 ]
}

@test "Ensure OpenSSH MAC umac-128@openssh.com is not used" {
  run sshdConfig 'umac-128@openssh.com'
  [ "$status" -eq 1 ]
}

@test "Ensure OpenSSH MAC hmac-md5-etm@openssh.com is not used" {
  run sshdConfig 'hmac-md5-etm@openssh.com'
  [ "$status" -eq 1 ]
}

@test "Ensure OpenSSH MAC hmac-md5-96-etm@openssh.com is not used" {
  run sshdConfig 'hmac-md5-96-etm@openssh.com'
  [ "$status" -eq 1 ]
}

@test "Ensure OpenSSH MAC hmac-ripemd160-etm@openssh.com is not used" {
  run sshdConfig 'hmac-ripemd160-etm@openssh.com'
  [ "$status" -eq 1 ]
}

@test "Ensure OpenSSH MAC hmac-sha1-etm@openssh.com is not used" {
  run sshdConfig 'hmac-sha1-etm@openssh.com'
  [ "$status" -eq 1 ]
}

@test "Ensure OpenSSH MAC hmac-sha1-96-etm@openssh.com is not used" {
  run sshdConfig 'hmac-sha1-96-etm@openssh.com'
  [ "$status" -eq 1 ]
}

@test "Ensure OpenSSH MAC umac-64-etm@openssh.com is not used" {
  run sshdConfig 'umac-64-etm@openssh.com'
  [ "$status" -eq 1 ]
}

@test "Ensure OpenSSH MAC umac-128-etm@openssh.com is not used" {
  run sshdConfig 'umac-128-etm@openssh.com'
  [ "$status" -eq 1 ]
}

@test "Ensure OpenSSH cipher 3des-cbc is not used" {
  run sshdConfig '3des-cbc'
  [ "$status" -eq 1 ]
}

@test "Ensure OpenSSH cipher aes128-cbc is not used" {
  run sshdConfig 'aes128-cbc'
  [ "$status" -eq 1 ]
}

@test "Ensure OpenSSH cipher aes192-cbc is not used" {
  run sshdConfig 'aes192-cbc'
  [ "$status" -eq 1 ]
}

@test "Ensure OpenSSH cipher aes256-cbc is not used" {
  run sshdConfig 'aes256-cbc'
  [ "$status" -eq 1 ]
}

@test "Ensure OpenSSH cipher arcfour is not used" {
  run sshdConfig 'arcfour'
  [ "$status" -eq 1 ]
}

@test "Ensure OpenSSH cipher arcfour128 is not used" {
  run sshdConfig 'arcfour128'
  [ "$status" -eq 1 ]
}

@test "Ensure OpenSSH cipher arcfour256 is not used" {
  run sshdConfig 'arcfour256'
  [ "$status" -eq 1 ]
}

@test "Ensure OpenSSH cipher blowfish-cbc is not used" {
  run sshdConfig 'blowfish-cbc'
  [ "$status" -eq 1 ]
}

@test "Ensure OpenSSH cipher cast128-cbc is not used" {
  run sshdConfig 'cast128-cbc'
  [ "$status" -eq 1 ]
}

@test "Ensure OpenSSH cipher rijndael-cbc@lysator.liu.se is not used" {
  run sshdConfig 'rijndael-cbc@lysator.liu.se'
  [ "$status" -eq 1 ]
}

@test "Ensure OpenSSH KEX diffie-hellman-group1-sha1 is not used" {
  run sshdConfig 'diffie-hellman-group1-sha1'
  [ "$status" -eq 1 ]
}

@test "Ensure OpenSSH KEX diffie-hellman-group14-sha1 is not used" {
  run sshdConfig 'diffie-hellman-group14-sha1'
  [ "$status" -eq 1 ]
}

@test "Ensure OpenSSH KEX diffie-hellman-group-exchange-sha1 is not used" {
  run sshdConfig 'diffie-hellman-group-exchange-sha1'
  [ "$status" -eq 1 ]
}
