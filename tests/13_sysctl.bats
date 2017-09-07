#!/usr/bin/env bats

load test_helper

@test "Verify fs.protected_hardlinks in $SYSCTL" {
	run bash -c "grep '^fs.protected_hardlinks.*1$' $SYSCTL"
	[ "$status" -eq 0 ]
}

@test "Verify fs.protected_symlinks in $SYSCTL" {
	run bash -c "grep '^fs.protected_symlinks.*1$' $SYSCTL"
	[ "$status" -eq 0 ]
}

@test "Verify fs.suid_dumpable in $SYSCTL" {
	run bash -c "grep '^fs.suid_dumpable.*0$' $SYSCTL"
	[ "$status" -eq 0 ]
}

@test "Verify kernel.core_uses_pid in $SYSCTL" {
	run bash -c "grep '^kernel.core_uses_pid.*1$' $SYSCTL"
	[ "$status" -eq 0 ]
}

@test "Verify kernel.kptr_restrict in $SYSCTL" {
	run bash -c "grep '^kernel.kptr_restrict.*2$' $SYSCTL"
	[ "$status" -eq 0 ]
}

@test "Verify kernel.modules_disabled in $SYSCTL" {
	run bash -c "grep '^kernel.modules_disabled.*1$' $SYSCTL"
	[ "$status" -eq 0 ]
}

@test "Verify kernel.panic in $SYSCTL" {
	run bash -c "grep '^kernel.panic.*60$' $SYSCTL"
	[ "$status" -eq 0 ]
}

@test "Verify kernel.panic_on_oops in $SYSCTL" {
	run bash -c "grep '^kernel.panic_on_oops.*60$' $SYSCTL"
	[ "$status" -eq 0 ]
}

@test "Verify kernel.perf_event_paranoid in $SYSCTL" {
	run bash -c "grep '^kernel.perf_event_paranoid.*2$' $SYSCTL"
	[ "$status" -eq 0 ]
}

@test "Verify kernel.randomize_va_space in $SYSCTL" {
	run bash -c "grep '^kernel.randomize_va_space.*2$' $SYSCTL"
	[ "$status" -eq 0 ]
}

@test "Verify kernel.sysrq in $SYSCTL" {
	run bash -c "grep '^kernel.sysrq.*0$' $SYSCTL"
	[ "$status" -eq 0 ]
}

@test "Verify kernel.yama.ptrace_scope in $SYSCTL" {
	run bash -c "grep '^kernel.yama.ptrace_scope.*1$' $SYSCTL"
	[ "$status" -eq 0 ]
}

@test "Verify net.ipv4.conf.all.accept_redirects in $SYSCTL" {
	run bash -c "grep '^net.ipv4.conf.all.accept_redirects.*0$' $SYSCTL"
	[ "$status" -eq 0 ]
}

@test "Verify net.ipv4.conf.all.accept_source_route in $SYSCTL" {
	run bash -c "grep '^net.ipv4.conf.all.accept_source_route.*0$' $SYSCTL"
	[ "$status" -eq 0 ]
}

@test "Verify net.ipv4.conf.all.log_martians in $SYSCTL" {
	run bash -c "grep '^net.ipv4.conf.all.log_martians.*1$' $SYSCTL"
	[ "$status" -eq 0 ]
}

@test "Verify net.ipv4.conf.all.rp_filter in $SYSCTL" {
	run bash -c "grep '^net.ipv4.conf.all.rp_filter.*1$' $SYSCTL"
	[ "$status" -eq 0 ]
}

@test "Verify net.ipv4.conf.all.secure_redirects in $SYSCTL" {
	run bash -c "grep '^net.ipv4.conf.all.secure_redirects.*0$' $SYSCTL"
	[ "$status" -eq 0 ]
}

@test "Verify net.ipv4.conf.all.send_redirects in $SYSCTL" {
	run bash -c "grep '^net.ipv4.conf.all.send_redirects.*0$' $SYSCTL"
	[ "$status" -eq 0 ]
}

@test "Verify net.ipv4.conf.default.accept_redirects in $SYSCTL" {
	run bash -c "grep '^net.ipv4.conf.default.accept_redirects.*0$' $SYSCTL"
	[ "$status" -eq 0 ]
}

@test "Verify net.ipv4.conf.default.accept_source_route in $SYSCTL" {
	run bash -c "grep '^net.ipv4.conf.default.accept_source_route.*0$' $SYSCTL"
	[ "$status" -eq 0 ]
}

@test "Verify net.ipv4.conf.default.log_martians in $SYSCTL" {
	run bash -c "grep '^net.ipv4.conf.default.log_martians.*1$' $SYSCTL"
	[ "$status" -eq 0 ]
}

@test "Verify net.ipv4.conf.default.rp_filter in $SYSCTL" {
	run bash -c "grep '^net.ipv4.conf.default.rp_filter.*1$' $SYSCTL"
	[ "$status" -eq 0 ]
}

@test "Verify net.ipv4.conf.default.secure_redirects in $SYSCTL" {
	run bash -c "grep '^net.ipv4.conf.default.secure_redirects.*0$' $SYSCTL"
	[ "$status" -eq 0 ]
}

@test "Verify net.ipv4.conf.default.send_redirects in $SYSCTL" {
	run bash -c "grep '^net.ipv4.conf.default.send_redirects.*0$' $SYSCTL"
	[ "$status" -eq 0 ]
}

@test "Verify net.ipv4.icmp_echo_ignore_broadcasts in $SYSCTL" {
	run bash -c "grep '^net.ipv4.icmp_echo_ignore_broadcasts.*1$' $SYSCTL"
	[ "$status" -eq 0 ]
}

@test "Verify net.ipv4.icmp_ignore_bogus_error_responses in $SYSCTL" {
	run bash -c "grep '^net.ipv4.icmp_ignore_bogus_error_responses.*1$' $SYSCTL"
	[ "$status" -eq 0 ]
}

@test "Verify net.ipv4.ip_forward in $SYSCTL" {
	run bash -c "grep '^net.ipv4.ip_forward.*0$' $SYSCTL"
	[ "$status" -eq 0 ]
}

@test "Verify net.ipv4.tcp_challenge_ack_limit in $SYSCTL" {
  ack_limit_result=$(grep '^net.ipv4.tcp_challenge_ack_limit.*' $SYSCTL | awk '{print $NF >= 1000}')
  [ $ack_limit_result -eq 1 ]
}

@test "Verify net.ipv4.tcp_max_syn_backlog in $SYSCTL" {
	run bash -c "grep '^net.ipv4.tcp_max_syn_backlog.*2048$' $SYSCTL"
	[ "$status" -eq 0 ]
}

@test "Verify net.ipv4.tcp_rfc1337 in $SYSCTL" {
	run bash -c "grep '^net.ipv4.tcp_rfc1337.*1$' $SYSCTL"
	[ "$status" -eq 0 ]
}

@test "Verify net.ipv4.tcp_synack_retries in $SYSCTL" {
	run bash -c "grep '^net.ipv4.tcp_synack_retries.*2$' $SYSCTL"
	[ "$status" -eq 0 ]
}

@test "Verify net.ipv4.tcp_syncookies in $SYSCTL" {
	run bash -c "grep '^net.ipv4.tcp_syncookies.*1$' $SYSCTL"
	[ "$status" -eq 0 ]
}

@test "Verify net.ipv4.tcp_syn_retries in $SYSCTL" {
	run bash -c "grep '^net.ipv4.tcp_syn_retries.*5$' $SYSCTL"
	[ "$status" -eq 0 ]
}

@test "Verify net.ipv4.tcp_timestamps in $SYSCTL" {
	run bash -c "grep '^net.ipv4.tcp_timestamps.*0$' $SYSCTL"
	[ "$status" -eq 0 ]
}

@test "Verify net.ipv6.conf.all.use_tempaddr in $SYSCTL" {
	run bash -c "grep '^net.ipv6.conf.all.use_tempaddr.*2$' $SYSCTL"
	[ "$status" -eq 0 ]
}

@test "Verify net.ipv6.conf.all.accept_ra in $SYSCTL" {
	run bash -c "grep '^net.ipv6.conf.all.accept_ra.*0$' $SYSCTL"
	[ "$status" -eq 0 ]
}

@test "Verify net.ipv6.conf.all.accept_redirects in $SYSCTL" {
	run bash -c "grep '^net.ipv6.conf.all.accept_redirects.*0$' $SYSCTL"
	[ "$status" -eq 0 ]
}

@test "Verify net.ipv6.conf.default.accept_ra in $SYSCTL" {
	run bash -c "grep '^net.ipv6.conf.default.accept_ra.*0$' $SYSCTL"
	[ "$status" -eq 0 ]
}

@test "Verify net.ipv6.conf.default.accept_ra_defrtr in $SYSCTL" {
	run bash -c "grep '^net.ipv6.conf.default.accept_ra_defrtr.*0$' $SYSCTL"
	[ "$status" -eq 0 ]
}

@test "Verify net.ipv6.conf.default.accept_ra_pinfo in $SYSCTL" {
	run bash -c "grep '^net.ipv6.conf.default.accept_ra_pinfo.*0$' $SYSCTL"
	[ "$status" -eq 0 ]
}

@test "Verify net.ipv6.conf.default.accept_redirects in $SYSCTL" {
	run bash -c "grep '^net.ipv6.conf.default.accept_redirects.*0$' $SYSCTL"
	[ "$status" -eq 0 ]
}

@test "Verify net.ipv6.conf.default.autoconf in $SYSCTL" {
	run bash -c "grep '^net.ipv6.conf.default.autoconf.*0$' $SYSCTL"
	[ "$status" -eq 0 ]
}

@test "Verify net.ipv6.conf.default.dad_transmits in $SYSCTL" {
	run bash -c "grep '^net.ipv6.conf.default.dad_transmits.*0$' $SYSCTL"
	[ "$status" -eq 0 ]
}

@test "Verify net.ipv6.conf.default.max_addresses in $SYSCTL" {
	run bash -c "grep '^net.ipv6.conf.default.max_addresses.*1$' $SYSCTL"
	[ "$status" -eq 0 ]
}

@test "Verify net.ipv6.conf.default.router_solicitations in $SYSCTL" {
	run bash -c "grep '^net.ipv6.conf.default.router_solicitations.*0$' $SYSCTL"
	[ "$status" -eq 0 ]
}

@test "Verify net.ipv6.conf.default.use_tempaddr in $SYSCTL" {
	run bash -c "grep '^net.ipv6.conf.default.use_tempaddr.*2$' $SYSCTL"
	[ "$status" -eq 0 ]
}

@test "Verify net.ipv6.conf.*.accept_ra_rtr_pref in $SYSCTL" {
	run bash -c "grep '^net.ipv6.conf.*.accept_ra_rtr_pref.*0$' $SYSCTL"
	[ "$status" -eq 0 ]
}

@test "Verify net.netfilter.nf_conntrack_max in $SYSCTL" {
	run bash -c "grep '^net.netfilter.nf_conntrack_max.*2000000$' $SYSCTL"
	[ "$status" -eq 0 ]
}

@test "Verify net.netfilter.nf_conntrack_tcp_loose in $SYSCTL" {
	run bash -c "grep '^net.netfilter.nf_conntrack_tcp_loose.*0$' $SYSCTL"
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

@test "Verify sysctl runtime kernel.yama.ptrace_scope" {
	run sysctlRuntime '^kernel.yama.ptrace_scope.*1$'
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
  ack_limit_result=$(sysctl --all | grep '^net.ipv4.tcp_challenge_ack_limit.*' | awk '{print $NF >= 1000}')
  [ $ack_limit_result -eq 1 ]
}

@test "Verify sysctl runtime net.ipv4.tcp_max_syn_backlog" {
	run sysctlRuntime '^net.ipv4.tcp_max_syn_backlog.*2048$'
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

@test "Verify sysctl runtime net.ipv4.tcp_timestamps" {
	run sysctlRuntime '^net.ipv4.tcp_timestamps.*0$'
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
