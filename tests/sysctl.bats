#!/usr/bin/env bats

load test_helper

@test "Verify dev.tty.ldisc_autoload in /etc/sysctl.* /usr/lib/sysctl.*" {
  run bash -c "grep -R 'dev.tty.ldisc_autoload.*0$' /etc/sysctl.* /usr/lib/sysctl.*"
  [ "$status" -eq 0 ]
}

@test "Verify fs.protected_hardlinks in /etc/sysctl.* /usr/lib/sysctl.*" {
  run bash -c "grep -R '^fs.protected_hardlinks.*1$' /etc/sysctl.* /usr/lib/sysctl.*"
  [ "$status" -eq 0 ]
}

@test "Verify fs.protected_symlinks in /etc/sysctl.* /usr/lib/sysctl.*" {
  run bash -c "grep -R '^fs.protected_symlinks.*1$' /etc/sysctl.* /usr/lib/sysctl.*"
  [ "$status" -eq 0 ]
}

@test "Verify fs.suid_dumpable in /etc/sysctl.* /usr/lib/sysctl.*" {
  run bash -c "grep -R '^fs.suid_dumpable.*0$' /etc/sysctl.* /usr/lib/sysctl.*"
  [ "$status" -eq 0 ]
}

@test "Verify kernel.core_uses_pid in /etc/sysctl.* /usr/lib/sysctl.*" {
  run bash -c "grep -R '^kernel.core_uses_pid.*1$' /etc/sysctl.* /usr/lib/sysctl.*"
  [ "$status" -eq 0 ]
}

@test "Verify kernel.dmesg_restrict in /etc/sysctl.* /usr/lib/sysctl.*" {
  run bash -c "grep -R '^kernel.dmesg_restrict.*1$' /etc/sysctl.* /usr/lib/sysctl.*"
  [ "$status" -eq 0 ]
}

@test "Verify kernel.kptr_restrict in /etc/sysctl.* /usr/lib/sysctl.*" {
  run bash -c "grep -R '^kernel.kptr_restrict.*2$' /etc/sysctl.* /usr/lib/sysctl.*"
  [ "$status" -eq 0 ]
}

@test "Verify kernel.modules_disabled in /etc/sysctl.* /usr/lib/sysctl.*" {
  run bash -c "grep -R '^kernel.modules_disabled.*1$' /etc/sysctl.* /usr/lib/sysctl.*"
  [ "$status" -eq 0 ]
}

@test "Verify kernel.panic in /etc/sysctl.* /usr/lib/sysctl.*" {
  run bash -c "grep -R '^kernel.panic.*60$' /etc/sysctl.* /usr/lib/sysctl.*"
  [ "$status" -eq 0 ]
}

@test "Verify kernel.panic_on_oops in /etc/sysctl.* /usr/lib/sysctl.*" {
  run bash -c "grep -R '^kernel.panic_on_oops.*60$' /etc/sysctl.* /usr/lib/sysctl.*"
  [ "$status" -eq 0 ]
}

@test "Verify kernel.perf_event_paranoid in /etc/sysctl.* /usr/lib/sysctl.*" {
  run bash -c "grep -R '^kernel.perf_event_paranoid.*2$' /etc/sysctl.* /usr/lib/sysctl.*"
  [ "$status" -eq 0 ]
}

@test "Verify kernel.randomize_va_space in /etc/sysctl.* /usr/lib/sysctl.*" {
  run bash -c "grep -R '^kernel.randomize_va_space.*2$' /etc/sysctl.* /usr/lib/sysctl.*"
  [ "$status" -eq 0 ]
}

@test "Verify kernel.sysrq in /etc/sysctl.* /usr/lib/sysctl.*" {
  run bash -c "grep -R '^kernel.sysrq.*0$' /etc/sysctl.* /usr/lib/sysctl.*"
  [ "$status" -eq 0 ]
}

@test "Verify kernel.unprivileged_bpf_disabled in /etc/sysctl.* /usr/lib/sysctl.*" {
  run bash -c "grep -R '^kernel.unprivileged_bpf_disabled.*1$' /etc/sysctl.* /usr/lib/sysctl.*"
  [ "$status" -eq 0 ]
}

@test "Verify kernel.yama.ptrace_scope in /etc/sysctl.* /usr/lib/sysctl.*" {
  run bash -c "grep -R '^kernel.yama.ptrace_scope.*2$' /etc/sysctl.* /usr/lib/sysctl.*"
  [ "$status" -eq 0 ]
}

@test "Verify net.core.bpf_jit_harden in /etc/sysctl.* /usr/lib/sysctl.*" {
  run bash -c "grep -R '^net.core.bpf_jit_harden.*2$' /etc/sysctl.* /usr/lib/sysctl.*"
  [ "$status" -eq 0 ]
}

@test "Verify net.ipv4.conf.all.accept_redirects in /etc/sysctl.* /usr/lib/sysctl.*" {
  run bash -c "grep -R '^net.ipv4.conf.all.accept_redirects.*0$' /etc/sysctl.* /usr/lib/sysctl.*"
  [ "$status" -eq 0 ]
}

@test "Verify net.ipv4.conf.all.accept_source_route in /etc/sysctl.* /usr/lib/sysctl.*" {
  run bash -c "grep -R '^net.ipv4.conf.all.accept_source_route.*0$' /etc/sysctl.* /usr/lib/sysctl.*"
  [ "$status" -eq 0 ]
}

@test "Verify net.ipv4.conf.all.log_martians in /etc/sysctl.* /usr/lib/sysctl.*" {
  run bash -c "grep -R '^net.ipv4.conf.all.log_martians.*1$' /etc/sysctl.* /usr/lib/sysctl.*"
  [ "$status" -eq 0 ]
}

@test "Verify net.ipv4.conf.all.rp_filter in /etc/sysctl.* /usr/lib/sysctl.*" {
  run bash -c "grep -R '^net.ipv4.conf.all.rp_filter.*1$' /etc/sysctl.* /usr/lib/sysctl.*"
  [ "$status" -eq 0 ]
}

@test "Verify net.ipv4.conf.all.secure_redirects in /etc/sysctl.* /usr/lib/sysctl.*" {
  run bash -c "grep -R '^net.ipv4.conf.all.secure_redirects.*0$' /etc/sysctl.* /usr/lib/sysctl.*"
  [ "$status" -eq 0 ]
}

@test "Verify net.ipv4.conf.all.send_redirects in /etc/sysctl.* /usr/lib/sysctl.*" {
  run bash -c "grep -R '^net.ipv4.conf.all.send_redirects.*0$' /etc/sysctl.* /usr/lib/sysctl.*"
  [ "$status" -eq 0 ]
}

@test "Verify net.ipv4.conf.all.shared_media in /etc/sysctl.* /usr/lib/sysctl.*" {
  run bash -c "grep -R '^net.ipv4.conf.all.shared_media.*0$' /etc/sysctl.* /usr/lib/sysctl.*"
  [ "$status" -eq 0 ]
}

@test "Verify net.ipv4.conf.default.accept_redirects in /etc/sysctl.* /usr/lib/sysctl.*" {
  run bash -c "grep -R '^net.ipv4.conf.default.accept_redirects.*0$' /etc/sysctl.* /usr/lib/sysctl.*"
  [ "$status" -eq 0 ]
}

@test "Verify net.ipv4.conf.default.accept_source_route in /etc/sysctl.* /usr/lib/sysctl.*" {
  run bash -c "grep -R '^net.ipv4.conf.default.accept_source_route.*0$' /etc/sysctl.* /usr/lib/sysctl.*"
  [ "$status" -eq 0 ]
}

@test "Verify net.ipv4.conf.default.log_martians in /etc/sysctl.* /usr/lib/sysctl.*" {
  run bash -c "grep -R '^net.ipv4.conf.default.log_martians.*1$' /etc/sysctl.* /usr/lib/sysctl.*"
  [ "$status" -eq 0 ]
}

@test "Verify net.ipv4.conf.default.rp_filter in /etc/sysctl.* /usr/lib/sysctl.*" {
  run bash -c "grep -R '^net.ipv4.conf.default.rp_filter.*1$' /etc/sysctl.* /usr/lib/sysctl.*"
  [ "$status" -eq 0 ]
}

@test "Verify net.ipv4.conf.default.secure_redirects in /etc/sysctl.* /usr/lib/sysctl.*" {
  run bash -c "grep -R '^net.ipv4.conf.default.secure_redirects.*0$' /etc/sysctl.* /usr/lib/sysctl.*"
  [ "$status" -eq 0 ]
}

@test "Verify net.ipv4.conf.default.send_redirects in /etc/sysctl.* /usr/lib/sysctl.*" {
  run bash -c "grep -R '^net.ipv4.conf.default.send_redirects.*0$' /etc/sysctl.* /usr/lib/sysctl.*"
  [ "$status" -eq 0 ]
}

@test "Verify net.ipv4.conf.default.shared_media in /etc/sysctl.* /usr/lib/sysctl.*" {
  run bash -c "grep -R '^net.ipv4.conf.default.shared_media.*0$' /etc/sysctl.* /usr/lib/sysctl.*"
  [ "$status" -eq 0 ]
}

@test "Verify net.ipv4.icmp_echo_ignore_broadcasts in /etc/sysctl.* /usr/lib/sysctl.*" {
  run bash -c "grep -R '^net.ipv4.icmp_echo_ignore_broadcasts.*1$' /etc/sysctl.* /usr/lib/sysctl.*"
  [ "$status" -eq 0 ]
}

@test "Verify net.ipv4.icmp_ignore_bogus_error_responses in /etc/sysctl.* /usr/lib/sysctl.*" {
  run bash -c "grep -R '^net.ipv4.icmp_ignore_bogus_error_responses.*1$' /etc/sysctl.* /usr/lib/sysctl.*"
  [ "$status" -eq 0 ]
}

@test "Verify net.ipv4.ip_forward in /etc/sysctl.* /usr/lib/sysctl.*" {
  run bash -c "grep -R '^net.ipv4.ip_forward.*0$' /etc/sysctl.* /usr/lib/sysctl.*"
  [ "$status" -eq 0 ]
}

@test "Verify net.ipv4.tcp_challenge_ack_limit in /etc/sysctl.* /usr/lib/sysctl.*" {
  run bash -c "grep -R '^net.ipv4.tcp_challenge_ack_limit.*[0-9][0-9][0-9][0-9][0-9][0-9]$' /etc/sysctl.* /usr/lib/sysctl.*"
  [ "$status" -eq 0 ]
}

@test "Verify net.ipv4.tcp_invalid_ratelimit in /etc/sysctl.* /usr/lib/sysctl.*" {
  run bash -c "grep -R '^net.ipv4.tcp_invalid_ratelimit.*500$' /etc/sysctl.* /usr/lib/sysctl.*"
  [ "$status" -eq 0 ]
}

@test "Verify net.ipv4.tcp_max_syn_backlog in /etc/sysctl.* /usr/lib/sysctl.*" {
  run bash -c "grep -R '^net.ipv4.tcp_max_syn_backlog.*20480$' /etc/sysctl.* /usr/lib/sysctl.*"
  [ "$status" -eq 0 ]
}

@test "Verify net.ipv4.tcp_rfc1337 in /etc/sysctl.* /usr/lib/sysctl.*" {
  run bash -c "grep -R '^net.ipv4.tcp_rfc1337.*1$' /etc/sysctl.* /usr/lib/sysctl.*"
  [ "$status" -eq 0 ]
}

@test "Verify net.ipv4.tcp_synack_retries in /etc/sysctl.* /usr/lib/sysctl.*" {
  run bash -c "grep -R '^net.ipv4.tcp_synack_retries.*2$' /etc/sysctl.* /usr/lib/sysctl.*"
  [ "$status" -eq 0 ]
}

@test "Verify net.ipv4.tcp_syncookies in /etc/sysctl.* /usr/lib/sysctl.*" {
  run bash -c "grep -R '^net.ipv4.tcp_syncookies.*1$' /etc/sysctl.* /usr/lib/sysctl.*"
  [ "$status" -eq 0 ]
}

@test "Verify net.ipv4.tcp_syn_retries in /etc/sysctl.* /usr/lib/sysctl.*" {
  run bash -c "grep -R '^net.ipv4.tcp_syn_retries.*5$' /etc/sysctl.* /usr/lib/sysctl.*"
  [ "$status" -eq 0 ]
}

@test "Verify net.ipv6.conf.all.use_tempaddr in /etc/sysctl.* /usr/lib/sysctl.*" {
  run bash -c "grep -R '^net.ipv6.conf.all.use_tempaddr.*2$' /etc/sysctl.* /usr/lib/sysctl.*"
  [ "$status" -eq 0 ]
}

@test "Verify net.ipv6.conf.all.accept_source_route in /etc/sysctl.* /usr/lib/sysctl.*" {
  run bash -c "grep -R '^net.ipv6.conf.all.accept_source_route.*0$' /etc/sysctl.* /usr/lib/sysctl.*"
  [ "$status" -eq 0 ]
}

@test "Verify net.ipv6.conf.all.accept_ra in /etc/sysctl.* /usr/lib/sysctl.*" {
  run bash -c "grep -R '^net.ipv6.conf.all.accept_ra.*0$' /etc/sysctl.* /usr/lib/sysctl.*"
  [ "$status" -eq 0 ]
}

@test "Verify net.ipv6.conf.all.accept_redirects in /etc/sysctl.* /usr/lib/sysctl.*" {
  run bash -c "grep -R '^net.ipv6.conf.all.accept_redirects.*0$' /etc/sysctl.* /usr/lib/sysctl.*"
  [ "$status" -eq 0 ]
}

@test "Verify net.ipv6.conf.default.accept_ra in /etc/sysctl.* /usr/lib/sysctl.*" {
  run bash -c "grep -R '^net.ipv6.conf.default.accept_ra.*0$' /etc/sysctl.* /usr/lib/sysctl.*"
  [ "$status" -eq 0 ]
}

@test "Verify net.ipv6.conf.default.accept_ra_defrtr in /etc/sysctl.* /usr/lib/sysctl.*" {
  run bash -c "grep -R '^net.ipv6.conf.default.accept_ra_defrtr.*0$' /etc/sysctl.* /usr/lib/sysctl.*"
  [ "$status" -eq 0 ]
}

@test "Verify net.ipv6.conf.default.accept_ra_pinfo in /etc/sysctl.* /usr/lib/sysctl.*" {
  run bash -c "grep -R '^net.ipv6.conf.default.accept_ra_pinfo.*0$' /etc/sysctl.* /usr/lib/sysctl.*"
  [ "$status" -eq 0 ]
}

@test "Verify net.ipv6.conf.default.accept_redirects in /etc/sysctl.* /usr/lib/sysctl.*" {
  run bash -c "grep -R '^net.ipv6.conf.default.accept_redirects.*0$' /etc/sysctl.* /usr/lib/sysctl.*"
  [ "$status" -eq 0 ]
}

@test "Verify net.ipv6.conf.default.autoconf in /etc/sysctl.* /usr/lib/sysctl.*" {
  run bash -c "grep -R '^net.ipv6.conf.default.autoconf.*0$' /etc/sysctl.* /usr/lib/sysctl.*"
  [ "$status" -eq 0 ]
}

@test "Verify net.ipv6.conf.default.dad_transmits in /etc/sysctl.* /usr/lib/sysctl.*" {
  run bash -c "grep -R '^net.ipv6.conf.default.dad_transmits.*0$' /etc/sysctl.* /usr/lib/sysctl.*"
  [ "$status" -eq 0 ]
}

@test "Verify net.ipv6.conf.default.max_addresses in /etc/sysctl.* /usr/lib/sysctl.*" {
  run bash -c "grep -R '^net.ipv6.conf.default.max_addresses.*1$' /etc/sysctl.* /usr/lib/sysctl.*"
  [ "$status" -eq 0 ]
}

@test "Verify net.ipv6.conf.default.router_solicitations in /etc/sysctl.* /usr/lib/sysctl.*" {
  run bash -c "grep -R '^net.ipv6.conf.default.router_solicitations.*0$' /etc/sysctl.* /usr/lib/sysctl.*"
  [ "$status" -eq 0 ]
}

@test "Verify net.ipv6.conf.default.use_tempaddr in /etc/sysctl.* /usr/lib/sysctl.*" {
  run bash -c "grep -R '^net.ipv6.conf.default.use_tempaddr.*2$' /etc/sysctl.* /usr/lib/sysctl.*"
  [ "$status" -eq 0 ]
}

@test "Verify net.ipv6.conf.*.accept_ra_rtr_pref in /etc/sysctl.* /usr/lib/sysctl.*" {
  run bash -c "grep -R '^net.ipv6.conf.*.accept_ra_rtr_pref.*0$' /etc/sysctl.* /usr/lib/sysctl.*"
  [ "$status" -eq 0 ]
}

@test "Verify net.netfilter.nf_conntrack_max in /etc/sysctl.* /usr/lib/sysctl.*" {
  run bash -c "grep -R '^net.netfilter.nf_conntrack_max.*2000000$' /etc/sysctl.* /usr/lib/sysctl.*"
  [ "$status" -eq 0 ]
}

@test "Verify net.netfilter.nf_conntrack_tcp_loose in /etc/sysctl.* /usr/lib/sysctl.*" {
  run bash -c "grep -R '^net.netfilter.nf_conntrack_tcp_loose.*0$' /etc/sysctl.* /usr/lib/sysctl.*"
  [ "$status" -eq 0 ]
}
@test "Verify sysctl runtime fs.protected_hardlinks" {
  run sysctlRuntime '^fs.protected_hardlinks.*1$'
  [ "$status" -eq 0 ]
}

@test "Verify sysctl runtime fs.protected_symlinks" {
  run sysctlRuntime '^fs.protected_symlinks.*1$'
  [ "$status" -eq 0 ]
}

@test "Verify sysctl runtime fs.suid_dumpable" {
  run sysctlRuntime '^fs.suid_dumpable.*0$'
  [ "$status" -eq 0 ]
}

@test "Verify sysctl runtime kernel.core_uses_pid" {
  run sysctlRuntime '^kernel.core_uses_pid.*1$'
  [ "$status" -eq 0 ]
}

@test "Verify sysctl runtime kernel.kptr_restrict" {
  run sysctlRuntime '^kernel.kptr_restrict.*2$'
  [ "$status" -eq 0 ]
}

@test "Verify sysctl runtime kernel.modules_disabled" {
  run sysctlRuntime '^kernel.modules_disabled.*1$'
  [ "$status" -eq 0 ]
}

@test "Verify sysctl runtime kernel.panic" {
  run sysctlRuntime '^kernel.panic.*60$'
  [ "$status" -eq 0 ]
}

@test "Verify sysctl runtime kernel.panic_on_oops" {
  run sysctlRuntime '^kernel.panic_on_oops.*60$'
  [ "$status" -eq 0 ]
}

@test "Verify sysctl runtime kernel.perf_event_paranoid" {
  run sysctlRuntime '^kernel.perf_event_paranoid.*2$'
  [ "$status" -eq 0 ]
}

@test "Verify sysctl runtime kernel.randomize_va_space" {
  run sysctlRuntime '^kernel.randomize_va_space.*2$'
  [ "$status" -eq 0 ]
}

@test "Verify sysctl runtime kernel.sysrq" {
  run sysctlRuntime '^kernel.sysrq.*0$'
  [ "$status" -eq 0 ]
}

@test "Verify sysctl runtime kernel.unprivileged_bpf_disabled" {
  run sysctlRuntime '^kernel.unprivileged_bpf_disabled.*1$'
  [ "$status" -eq 0 ]
}

@test "Verify sysctl runtime kernel.yama.ptrace_scope" {
  run sysctlRuntime '^kernel.yama.ptrace_scope.*2$'
  [ "$status" -eq 0 ]
}

@test "Verify sysctl runtime net.core.bpf_jit_harden" {
  run sysctlRuntime '^net.core.bpf_jit_harden.*2$'
  [ "$status" -eq 0 ]
}

@test "Verify sysctl runtime net.ipv4.conf.all.accept_redirects" {
  run sysctlRuntime '^net.ipv4.conf.all.accept_redirects.*0$'
  [ "$status" -eq 0 ]
}

@test "Verify sysctl runtime net.ipv4.conf.all.accept_source_route" {
  run sysctlRuntime '^net.ipv4.conf.all.accept_source_route.*0$'
  [ "$status" -eq 0 ]
}

@test "Verify sysctl runtime net.ipv4.conf.all.log_martians" {
  run sysctlRuntime '^net.ipv4.conf.all.log_martians.*1$'
  [ "$status" -eq 0 ]
}

@test "Verify sysctl runtime net.ipv4.conf.all.rp_filter" {
  run sysctlRuntime '^net.ipv4.conf.all.rp_filter.*1$'
  [ "$status" -eq 0 ]
}

@test "Verify sysctl runtime net.ipv4.conf.all.secure_redirects" {
  run sysctlRuntime '^net.ipv4.conf.all.secure_redirects.*0$'
  [ "$status" -eq 0 ]
}

@test "Verify sysctl runtime net.ipv4.conf.all.send_redirects" {
  run sysctlRuntime '^net.ipv4.conf.all.send_redirects.*0$'
  [ "$status" -eq 0 ]
}

@test "Verify sysctl runtime net.ipv4.conf.default.accept_redirects" {
  run sysctlRuntime '^net.ipv4.conf.default.accept_redirects.*0$'
  [ "$status" -eq 0 ]
}

@test "Verify sysctl runtime net.ipv4.conf.default.accept_source_route" {
  run sysctlRuntime '^net.ipv4.conf.default.accept_source_route.*0$'
  [ "$status" -eq 0 ]
}

@test "Verify sysctl runtime net.ipv4.conf.default.log_martians" {
  run sysctlRuntime '^net.ipv4.conf.default.log_martians.*1$'
  [ "$status" -eq 0 ]
}

@test "Verify sysctl runtime net.ipv4.conf.default.rp_filter" {
  run sysctlRuntime '^net.ipv4.conf.default.rp_filter.*1$'
  [ "$status" -eq 0 ]
}

@test "Verify sysctl runtime net.ipv4.conf.default.secure_redirects" {
  run sysctlRuntime '^net.ipv4.conf.default.secure_redirects.*0$'
  [ "$status" -eq 0 ]
}

@test "Verify sysctl runtime net.ipv4.conf.default.send_redirects" {
  run sysctlRuntime '^net.ipv4.conf.default.send_redirects.*0$'
  [ "$status" -eq 0 ]
}

@test "Verify sysctl runtime net.ipv4.icmp_echo_ignore_broadcasts" {
  run sysctlRuntime '^net.ipv4.icmp_echo_ignore_broadcasts.*1$'
  [ "$status" -eq 0 ]
}

@test "Verify sysctl runtime net.ipv4.icmp_ignore_bogus_error_responses" {
  run sysctlRuntime '^net.ipv4.icmp_ignore_bogus_error_responses.*1$'
  [ "$status" -eq 0 ]
}

@test "Verify sysctl runtime net.ipv4.ip_forward" {
  run sysctlRuntime '^net.ipv4.ip_forward.*0$'
  [ "$status" -eq 0 ]
}

@test "Verify sysctl runtime net.ipv4.tcp_challenge_ack_limit" {
  run bash -c "sysctl --all | grep '^net.ipv4.tcp_challenge_ack_limit.*[0-9][0-9][0-9][0-9][0-9][0-9]$'"
  [ "$status" -eq 0 ]
}

@test "Verify sysctl runtime net.ipv4.tcp_invalid_ratelimit" {
  run sysctlRuntime '^net.ipv4.tcp_invalid_ratelimit.*500$'
  [ "$status" -eq 0 ]
}

@test "Verify sysctl runtime net.ipv4.tcp_max_syn_backlog" {
  run sysctlRuntime '^net.ipv4.tcp_max_syn_backlog.*20480$'
  [ "$status" -eq 0 ]
}

@test "Verify sysctl runtime net.ipv4.tcp_rfc1337" {
  run sysctlRuntime '^net.ipv4.tcp_rfc1337.*1$'
  [ "$status" -eq 0 ]
}

@test "Verify sysctl runtime net.ipv4.tcp_synack_retries" {
  run sysctlRuntime '^net.ipv4.tcp_synack_retries.*2$'
  [ "$status" -eq 0 ]
}

@test "Verify sysctl runtime net.ipv4.tcp_syncookies" {
  run sysctlRuntime '^net.ipv4.tcp_syncookies.*1$'
  [ "$status" -eq 0 ]
}

@test "Verify sysctl runtime net.ipv4.tcp_syn_retries" {
  run sysctlRuntime '^net.ipv4.tcp_syn_retries.*5$'
  [ "$status" -eq 0 ]
}

@test "Verify sysctl runtime net.ipv6.conf.all.use_tempaddr" {
  run sysctlRuntime '^net.ipv6.conf.all.use_tempaddr.*2$'
  [ "$status" -eq 0 ]
}

@test "Verify sysctl runtime net.ipv6.conf.all.accept_ra" {
  run sysctlRuntime '^net.ipv6.conf.all.accept_ra.*0$'
  [ "$status" -eq 0 ]
}

@test "Verify sysctl runtime net.ipv6.conf.all.accept_redirects" {
  run sysctlRuntime '^net.ipv6.conf.all.accept_redirects.*0$'
  [ "$status" -eq 0 ]
}

@test "Verify sysctl runtime net.ipv6.conf.default.accept_ra" {
  run sysctlRuntime '^net.ipv6.conf.default.accept_ra.*0$'
  [ "$status" -eq 0 ]
}

@test "Verify sysctl runtime net.ipv6.conf.default.accept_ra_defrtr" {
  run sysctlRuntime '^net.ipv6.conf.default.accept_ra_defrtr.*0$'
  [ "$status" -eq 0 ]
}

@test "Verify sysctl runtime net.ipv6.conf.default.accept_ra_pinfo" {
  run sysctlRuntime '^net.ipv6.conf.default.accept_ra_pinfo.*0$'
  [ "$status" -eq 0 ]
}

@test "Verify sysctl runtime net.ipv6.conf.default.accept_redirects" {
  run sysctlRuntime '^net.ipv6.conf.default.accept_redirects.*0$'
  [ "$status" -eq 0 ]
}

@test "Verify sysctl runtime net.ipv6.conf.default.autoconf" {
  run sysctlRuntime '^net.ipv6.conf.default.autoconf.*0$'
  [ "$status" -eq 0 ]
}

@test "Verify sysctl runtime net.ipv6.conf.default.dad_transmits" {
  run sysctlRuntime '^net.ipv6.conf.default.dad_transmits.*0$'
  [ "$status" -eq 0 ]
}

@test "Verify sysctl runtime net.ipv6.conf.default.max_addresses" {
  run sysctlRuntime '^net.ipv6.conf.default.max_addresses.*1$'
  [ "$status" -eq 0 ]
}

@test "Verify sysctl runtime net.ipv6.conf.default.router_solicitations" {
  run sysctlRuntime '^net.ipv6.conf.default.router_solicitations.*0$'
  [ "$status" -eq 0 ]
}

@test "Verify sysctl runtime net.ipv6.conf.default.use_tempaddr" {
  run sysctlRuntime '^net.ipv6.conf.default.use_tempaddr.*2$'
  [ "$status" -eq 0 ]
}

@test "Verify sysctl runtime net.ipv6.conf.*.accept_ra_rtr_pref" {
  run sysctlRuntime '^net.ipv6.conf.*.accept_ra_rtr_pref.*0$'
  [ "$status" -eq 0 ]
}

@test "Verify sysctl runtime net.netfilter.nf_conntrack_max" {
  run sysctlRuntime '^net.netfilter.nf_conntrack_max.*2000000$'
  [ "$status" -eq 0 ]
}

@test "Verify sysctl runtime net.netfilter.nf_conntrack_tcp_loose" {
  run sysctlRuntime '^net.netfilter.nf_conntrack_tcp_loose.*0$'
  [ "$status" -eq 0 ]
}
