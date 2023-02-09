#/usr/bin/env bats

load test_helper

@test "Verify APT AllowRedirect" {
  run bash -c "grep '^Acquire::http::AllowRedirect \"false\";$' /etc/apt/apt.conf.d/*"
  [ "$status" -eq 0 ]
}

@test "Verify APT AllowUnauthenticated" {
  run bash -c "grep '^APT::Get::AllowUnauthenticated \"false\";$' /etc/apt/apt.conf.d/*"
  [ "$status" -eq 0 ]
}

@test "Verify APT AutocleanInterval" {
  run bash -c "grep '^APT::Periodic::AutocleanInterval \"7\";$' /etc/apt/apt.conf.d/*"
  [ "$status" -eq 0 ]
}

@test "Verify APT AutomaticRemove" {
  run bash -c "grep '^APT::Get::AutomaticRemove \"true\";$' /etc/apt/apt.conf.d/*"
  [ "$status" -eq 0 ]
}

@test "Verify APT Install-Recommends" {
  run bash -c "grep '^APT::Install-Recommends \"false\";$' /etc/apt/apt.conf.d/*"
  [ "$status" -eq 0 ]
}

@test "Verify APT Install-Suggests" {
  run bash -c "grep '^APT::Install-Suggests \"false\";$' /etc/apt/apt.conf.d/*"
  [ "$status" -eq 0 ]
}

@test "Verify APT Remove-Unused-Dependencies" {
  run bash -c "grep '^Unattended-Upgrade::Remove-Unused-Dependencies \"true\";$' /etc/apt/apt.conf.d/*"
  [ "$status" -eq 0 ]
}

@test "Verify APT Remove-Unused-Kernel-Packages" {
  run bash -c "grep '^Unattended-Upgrade::Remove-Unused-Kernel-Packages \"true\";$' /etc/apt/apt.conf.d/*"
  [ "$status" -eq 0 ]
}

@test "Verify APT AllowInsecureRepositories" {
  run bash -c "grep '^Acquire::AllowInsecureRepositories \"false\";$' /etc/apt/apt.conf.d/*"
  [ "$status" -eq 0 ]
}

@test "Verify APT AllowDowngradeToInsecureRepositories" {
  run bash -c "grep '^Acquire::AllowDowngradeToInsecureRepositories \"false\";$' /etc/apt/apt.conf.d/*"
  [ "$status" -eq 0 ]
}

@test "Verify APT SandboxSeccomp" {
  run bash -c "grep '^APT::Sandbox::Seccomp \"1\";$' /etc/apt/apt.conf.d/*"
  [ "$status" -eq 0 ]
}

@test "Verify APT runtime AllowRedirect" {
  run bash -c "apt-config dump | grep '^Acquire::http::AllowRedirect \"false\";$'"
  [ "$status" -eq 0 ]
}

@test "Verify APT runtime AllowUnauthenticated" {
  run bash -c "apt-config dump | grep '^APT::Get::AllowUnauthenticated \"false\";$'"
  [ "$status" -eq 0 ]
}

@test "Verify APT runtime AutocleanInterval" {
  run bash -c "apt-config dump | grep '^APT::Periodic::AutocleanInterval \"7\";$'"
  [ "$status" -eq 0 ]
}

@test "Verify APT runtime AutomaticRemove" {
  run bash -c "apt-config dump | grep '^APT::Get::AutomaticRemove \"true\";$'"
  [ "$status" -eq 0 ]
}

@test "Verify APT runtime Install-Recommends" {
  run bash -c "apt-config dump | grep '^APT::Install-Recommends \"false\";$'"
  [ "$status" -eq 0 ]
}

@test "Verify APT runtime Install-Suggests" {
  run bash -c "apt-config dump | grep '^APT::Install-Suggests \"false\";$'"
  [ "$status" -eq 0 ]
}

@test "Verify APT runtime Remove-Unused-Dependencies" {
  run bash -c "apt-config dump | grep '^Unattended-Upgrade::Remove-Unused-Dependencies \"true\";$'"
  [ "$status" -eq 0 ]
}

@test "Verify APT runtime Remove-Unused-Kernel-Packages" {
  run bash -c "apt-config dump | grep '^Unattended-Upgrade::Remove-Unused-Kernel-Packages \"true\";$'"
  [ "$status" -eq 0 ]
}

@test "Verify APT runtime AllowInsecureRepositories" {
  run bash -c "apt-config dump | grep '^Acquire::AllowInsecureRepositories \"false\";$'"
  [ "$status" -eq 0 ]
}

@test "Verify APT runtime AllowDowngradeToInsecureRepositories" {
  run bash -c "apt-config dump | grep '^Acquire::AllowDowngradeToInsecureRepositories \"false\";$'"
  [ "$status" -eq 0 ]
}

@test "Verify APT runtime SandboxSeccomp" {
  run bash -c "apt-config dump | grep '^APT::Sandbox::Seccomp \"1\";$'"
  [ "$status" -eq 0 ]
}
