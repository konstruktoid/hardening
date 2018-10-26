#/usr/bin/env bats

load test_helper

@test "Verify APT AllowUnauthenticated" {
  run bash -c "grep '^APT::Get::AllowUnauthenticated \"false\";$' /etc/apt/apt.conf.d/*"
  [ "$status" -eq 0 ]
}

@test "Verify APT AutocleanInterval" {
  run bash -c "grep '^APT::Periodic::AutocleanInterval \"7\";$' /etc/apt/apt.conf.d/*"
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
