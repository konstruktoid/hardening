#!/usr/bin/env bats

load test_helper

@test "Ensure apt hasn't SUID/GUID set" {
 run gotSGid apt
 [ "$status" -eq 1 ]
}

@test "Ensure apt-get hasn't SUID/GUID set" {
 run gotSGid apt-get
 [ "$status" -eq 1 ]
}

@test "Ensure aria2c hasn't SUID/GUID set" {
 run gotSGid aria2c
 [ "$status" -eq 1 ]
}

@test "Ensure arp hasn't SUID/GUID set" {
 run gotSGid arp
 [ "$status" -eq 1 ]
}

@test "Ensure ash hasn't SUID/GUID set" {
 run gotSGid ash
 [ "$status" -eq 1 ]
}

@test "Ensure at hasn't SUID/GUID set" {
 run gotSGid at
 [ "$status" -eq 1 ]
}

@test "Ensure awk hasn't SUID/GUID set" {
 run gotSGid awk
 [ "$status" -eq 1 ]
}

@test "Ensure base64 hasn't SUID/GUID set" {
 run gotSGid base64
 [ "$status" -eq 1 ]
}

@test "Ensure bash hasn't SUID/GUID set" {
 run gotSGid bash
 [ "$status" -eq 1 ]
}

@test "Ensure bpftrace hasn't SUID/GUID set" {
 run gotSGid bpftrace
 [ "$status" -eq 1 ]
}

@test "Ensure bsd-write hasn't SUID/GUID set" {
 run gotSGid bsd-write
 [ "$status" -eq 1 ]
}

@test "Ensure busybox hasn't SUID/GUID set" {
 run gotSGid busybox
 [ "$status" -eq 1 ]
}

@test "Ensure cancel hasn't SUID/GUID set" {
 run gotSGid cancel
 [ "$status" -eq 1 ]
}

@test "Ensure cat hasn't SUID/GUID set" {
 run gotSGid cat
 [ "$status" -eq 1 ]
}

@test "Ensure chage hasn't SUID/GUID set" {
 run gotSGid chage
 [ "$status" -eq 1 ]
}

@test "Ensure chfn hasn't SUID/GUID set" {
 run gotSGid chfn
 [ "$status" -eq 1 ]
}

@test "Ensure chmod hasn't SUID/GUID set" {
 run gotSGid chmod
 [ "$status" -eq 1 ]
}

@test "Ensure chown hasn't SUID/GUID set" {
 run gotSGid chown
 [ "$status" -eq 1 ]
}

@test "Ensure chsh hasn't SUID/GUID set" {
 run gotSGid chsh
 [ "$status" -eq 1 ]
}

@test "Ensure cp hasn't SUID/GUID set" {
 run gotSGid cp
 [ "$status" -eq 1 ]
}

@test "Ensure cpan hasn't SUID/GUID set" {
 run gotSGid cpan
 [ "$status" -eq 1 ]
}

@test "Ensure cpulimit hasn't SUID/GUID set" {
 run gotSGid cpulimit
 [ "$status" -eq 1 ]
}

@test "Ensure crontab hasn't SUID/GUID set" {
 run gotSGid crontab
 [ "$status" -eq 1 ]
}

@test "Ensure csh hasn't SUID/GUID set" {
 run gotSGid csh
 [ "$status" -eq 1 ]
}

@test "Ensure curl hasn't SUID/GUID set" {
 run gotSGid curl
 [ "$status" -eq 1 ]
}

@test "Ensure cut hasn't SUID/GUID set" {
 run gotSGid cut
 [ "$status" -eq 1 ]
}

@test "Ensure dash hasn't SUID/GUID set" {
 run gotSGid dash
 [ "$status" -eq 1 ]
}

@test "Ensure date hasn't SUID/GUID set" {
 run gotSGid date
 [ "$status" -eq 1 ]
}

@test "Ensure dd hasn't SUID/GUID set" {
 run gotSGid dd
 [ "$status" -eq 1 ]
}

@test "Ensure diff hasn't SUID/GUID set" {
 run gotSGid diff
 [ "$status" -eq 1 ]
}

@test "Ensure dmesg hasn't SUID/GUID set" {
 run gotSGid dmesg
 [ "$status" -eq 1 ]
}

@test "Ensure dmsetup hasn't SUID/GUID set" {
 run gotSGid dmsetup
 [ "$status" -eq 1 ]
}

@test "Ensure docker hasn't SUID/GUID set" {
 run gotSGid docker
 [ "$status" -eq 1 ]
}

@test "Ensure dpkg hasn't SUID/GUID set" {
 run gotSGid dpkg
 [ "$status" -eq 1 ]
}

@test "Ensure easy_install hasn't SUID/GUID set" {
 run gotSGid easy_install
 [ "$status" -eq 1 ]
}

@test "Ensure ed hasn't SUID/GUID set" {
 run gotSGid ed
 [ "$status" -eq 1 ]
}

@test "Ensure emacs hasn't SUID/GUID set" {
 run gotSGid emacs
 [ "$status" -eq 1 ]
}

@test "Ensure env hasn't SUID/GUID set" {
 run gotSGid env
 [ "$status" -eq 1 ]
}

@test "Ensure expand hasn't SUID/GUID set" {
 run gotSGid expand
 [ "$status" -eq 1 ]
}

@test "Ensure expect hasn't SUID/GUID set" {
 run gotSGid expect
 [ "$status" -eq 1 ]
}

@test "Ensure facter hasn't SUID/GUID set" {
 run gotSGid facter
 [ "$status" -eq 1 ]
}

@test "Ensure file hasn't SUID/GUID set" {
 run gotSGid file
 [ "$status" -eq 1 ]
}

@test "Ensure find hasn't SUID/GUID set" {
 run gotSGid find
 [ "$status" -eq 1 ]
}

@test "Ensure finger hasn't SUID/GUID set" {
 run gotSGid finger
 [ "$status" -eq 1 ]
}

@test "Ensure flock hasn't SUID/GUID set" {
 run gotSGid flock
 [ "$status" -eq 1 ]
}

@test "Ensure fmt hasn't SUID/GUID set" {
 run gotSGid fmt
 [ "$status" -eq 1 ]
}

@test "Ensure fold hasn't SUID/GUID set" {
 run gotSGid fold
 [ "$status" -eq 1 ]
}

@test "Ensure ftp hasn't SUID/GUID set" {
 run gotSGid ftp
 [ "$status" -eq 1 ]
}

@test "Ensure fusermount hasn't SUID/GUID set" {
 run gotSGid fusermount
 [ "$status" -eq 1 ]
}

@test "Ensure gawk hasn't SUID/GUID set" {
 run gotSGid gawk
 [ "$status" -eq 1 ]
}

@test "Ensure gdb hasn't SUID/GUID set" {
 run gotSGid gdb
 [ "$status" -eq 1 ]
}

@test "Ensure gimp hasn't SUID/GUID set" {
 run gotSGid gimp
 [ "$status" -eq 1 ]
}

@test "Ensure git hasn't SUID/GUID set" {
 run gotSGid git
 [ "$status" -eq 1 ]
}

@test "Ensure grep hasn't SUID/GUID set" {
 run gotSGid grep
 [ "$status" -eq 1 ]
}

@test "Ensure head hasn't SUID/GUID set" {
 run gotSGid head
 [ "$status" -eq 1 ]
}

@test "Ensure iftop hasn't SUID/GUID set" {
 run gotSGid iftop
 [ "$status" -eq 1 ]
}

@test "Ensure ionice hasn't SUID/GUID set" {
 run gotSGid ionice
 [ "$status" -eq 1 ]
}

@test "Ensure ip hasn't SUID/GUID set" {
 run gotSGid ip
 [ "$status" -eq 1 ]
}

@test "Ensure irb hasn't SUID/GUID set" {
 run gotSGid irb
 [ "$status" -eq 1 ]
}

@test "Ensure jjs hasn't SUID/GUID set" {
 run gotSGid jjs
 [ "$status" -eq 1 ]
}

@test "Ensure journalctl hasn't SUID/GUID set" {
 run gotSGid journalctl
 [ "$status" -eq 1 ]
}

@test "Ensure jq hasn't SUID/GUID set" {
 run gotSGid jq
 [ "$status" -eq 1 ]
}

@test "Ensure jrunscript hasn't SUID/GUID set" {
 run gotSGid jrunscript
 [ "$status" -eq 1 ]
}

@test "Ensure ksh hasn't SUID/GUID set" {
 run gotSGid ksh
 [ "$status" -eq 1 ]
}

@test "Ensure ld.so hasn't SUID/GUID set" {
 run gotSGid ld.so
 [ "$status" -eq 1 ]
}

@test "Ensure ldconfig hasn't SUID/GUID set" {
 run gotSGid ldconfig
 [ "$status" -eq 1 ]
}

@test "Ensure less hasn't SUID/GUID set" {
 run gotSGid less
 [ "$status" -eq 1 ]
}

@test "Ensure logsave hasn't SUID/GUID set" {
 run gotSGid logsave
 [ "$status" -eq 1 ]
}

@test "Ensure ltrace hasn't SUID/GUID set" {
 run gotSGid ltrace
 [ "$status" -eq 1 ]
}

@test "Ensure lua hasn't SUID/GUID set" {
 run gotSGid lua
 [ "$status" -eq 1 ]
}

@test "Ensure mail hasn't SUID/GUID set" {
 run gotSGid mail
 [ "$status" -eq 1 ]
}

@test "Ensure make hasn't SUID/GUID set" {
 run gotSGid make
 [ "$status" -eq 1 ]
}

@test "Ensure man hasn't SUID/GUID set" {
 run gotSGid man
 [ "$status" -eq 1 ]
}

@test "Ensure mawk hasn't SUID/GUID set" {
 run gotSGid mawk
 [ "$status" -eq 1 ]
}

@test "Ensure mlocate hasn't SUID/GUID set" {
 run gotSGid mlocate
 [ "$status" -eq 1 ]
}

@test "Ensure more hasn't SUID/GUID set" {
 run gotSGid more
 [ "$status" -eq 1 ]
}

@test "Ensure mount hasn't SUID/GUID set" {
 run gotSGid mount
 [ "$status" -eq 1 ]
}

@test "Ensure mount.nfs hasn't SUID/GUID set" {
 run gotSGid mount.nfs
 [ "$status" -eq 1 ]
}

@test "Ensure mtr hasn't SUID/GUID set" {
 run gotSGid mtr
 [ "$status" -eq 1 ]
}

@test "Ensure mv hasn't SUID/GUID set" {
 run gotSGid mv
 [ "$status" -eq 1 ]
}

@test "Ensure mysql hasn't SUID/GUID set" {
 run gotSGid mysql
 [ "$status" -eq 1 ]
}

@test "Ensure nano hasn't SUID/GUID set" {
 run gotSGid nano
 [ "$status" -eq 1 ]
}

@test "Ensure nawk hasn't SUID/GUID set" {
 run gotSGid nawk
 [ "$status" -eq 1 ]
}

@test "Ensure nc hasn't SUID/GUID set" {
 run gotSGid nc
 [ "$status" -eq 1 ]
}

@test "Ensure newgrp hasn't SUID/GUID set" {
 run gotSGid newgrp
 [ "$status" -eq 1 ]
}

@test "Ensure nice hasn't SUID/GUID set" {
 run gotSGid nice
 [ "$status" -eq 1 ]
}

@test "Ensure nl hasn't SUID/GUID set" {
 run gotSGid nl
 [ "$status" -eq 1 ]
}

@test "Ensure nmap hasn't SUID/GUID set" {
 run gotSGid nmap
 [ "$status" -eq 1 ]
}

@test "Ensure node hasn't SUID/GUID set" {
 run gotSGid node
 [ "$status" -eq 1 ]
}

@test "Ensure ntfs-3g hasn't SUID/GUID set" {
 run gotSGid ntfs-3g
 [ "$status" -eq 1 ]
}

@test "Ensure od hasn't SUID/GUID set" {
 run gotSGid od
 [ "$status" -eq 1 ]
}

@test "Ensure openssl hasn't SUID/GUID set" {
 run gotSGid openssl
 [ "$status" -eq 1 ]
}

@test "Ensure perl hasn't SUID/GUID set" {
 run gotSGid perl
 [ "$status" -eq 1 ]
}

@test "Ensure pg hasn't SUID/GUID set" {
 run gotSGid pg
 [ "$status" -eq 1 ]
}

@test "Ensure php hasn't SUID/GUID set" {
 run gotSGid php
 [ "$status" -eq 1 ]
}

@test "Ensure pic hasn't SUID/GUID set" {
 run gotSGid pic
 [ "$status" -eq 1 ]
}

@test "Ensure pico hasn't SUID/GUID set" {
 run gotSGid pico
 [ "$status" -eq 1 ]
}

@test "Ensure ping hasn't SUID/GUID set" {
 run gotSGid ping
 [ "$status" -eq 1 ]
}

@test "Ensure ping6 hasn't SUID/GUID set" {
 run gotSGid ping6
 [ "$status" -eq 1 ]
}

@test "Ensure pip hasn't SUID/GUID set" {
 run gotSGid pip
 [ "$status" -eq 1 ]
}

@test "Ensure pkexec hasn't SUID/GUID set" {
 run gotSGid pkexec
 [ "$status" -eq 1 ]
}

@test "Ensure pppd hasn't SUID/GUID set" {
 run gotSGid pppd
 [ "$status" -eq 1 ]
}

@test "Ensure puppet hasn't SUID/GUID set" {
 run gotSGid puppet
 [ "$status" -eq 1 ]
}

@test "Ensure python hasn't SUID/GUID set" {
 run gotSGid python
 [ "$status" -eq 1 ]
}

@test "Ensure readelf hasn't SUID/GUID set" {
 run gotSGid readelf
 [ "$status" -eq 1 ]
}

@test "Ensure red hasn't SUID/GUID set" {
 run gotSGid red
 [ "$status" -eq 1 ]
}

@test "Ensure rlogin hasn't SUID/GUID set" {
 run gotSGid rlogin
 [ "$status" -eq 1 ]
}

@test "Ensure rlwrap hasn't SUID/GUID set" {
 run gotSGid rlwrap
 [ "$status" -eq 1 ]
}

@test "Ensure rsync hasn't SUID/GUID set" {
 run gotSGid rsync
 [ "$status" -eq 1 ]
}

@test "Ensure ruby hasn't SUID/GUID set" {
 run gotSGid ruby
 [ "$status" -eq 1 ]
}

@test "Ensure run-mailcap hasn't SUID/GUID set" {
 run gotSGid run-mailcap
 [ "$status" -eq 1 ]
}

@test "Ensure run-parts hasn't SUID/GUID set" {
 run gotSGid run-parts
 [ "$status" -eq 1 ]
}

@test "Ensure rvim hasn't SUID/GUID set" {
 run gotSGid rvim
 [ "$status" -eq 1 ]
}

@test "Ensure scp hasn't SUID/GUID set" {
 run gotSGid scp
 [ "$status" -eq 1 ]
}

@test "Ensure screen hasn't SUID/GUID set" {
 run gotSGid screen
 [ "$status" -eq 1 ]
}

@test "Ensure script hasn't SUID/GUID set" {
 run gotSGid script
 [ "$status" -eq 1 ]
}

@test "Ensure sed hasn't SUID/GUID set" {
 run gotSGid sed
 [ "$status" -eq 1 ]
}

@test "Ensure service hasn't SUID/GUID set" {
 run gotSGid service
 [ "$status" -eq 1 ]
}

@test "Ensure setarch hasn't SUID/GUID set" {
 run gotSGid setarch
 [ "$status" -eq 1 ]
}

@test "Ensure sftp hasn't SUID/GUID set" {
 run gotSGid sftp
 [ "$status" -eq 1 ]
}

@test "Ensure shuf hasn't SUID/GUID set" {
 run gotSGid shuf
 [ "$status" -eq 1 ]
}

@test "Ensure smbclient hasn't SUID/GUID set" {
 run gotSGid smbclient
 [ "$status" -eq 1 ]
}

@test "Ensure socat hasn't SUID/GUID set" {
 run gotSGid socat
 [ "$status" -eq 1 ]
}

@test "Ensure sort hasn't SUID/GUID set" {
 run gotSGid sort
 [ "$status" -eq 1 ]
}

@test "Ensure sqlite3 hasn't SUID/GUID set" {
 run gotSGid sqlite3
 [ "$status" -eq 1 ]
}

@test "Ensure ssh hasn't SUID/GUID set" {
 run gotSGid ssh
 [ "$status" -eq 1 ]
}

@test "Ensure start-stop-daemon hasn't SUID/GUID set" {
 run gotSGid start-stop-daemon
 [ "$status" -eq 1 ]
}

@test "Ensure stdbuf hasn't SUID/GUID set" {
 run gotSGid stdbuf
 [ "$status" -eq 1 ]
}

@test "Ensure strace hasn't SUID/GUID set" {
 run gotSGid strace
 [ "$status" -eq 1 ]
}

@test "Ensure su hasn't SUID/GUID set" {
 run gotSGid su
 [ "$status" -eq 1 ]
}

@test "Ensure systemctl hasn't SUID/GUID set" {
 run gotSGid systemctl
 [ "$status" -eq 1 ]
}

@test "Ensure tail hasn't SUID/GUID set" {
 run gotSGid tail
 [ "$status" -eq 1 ]
}

@test "Ensure tar hasn't SUID/GUID set" {
 run gotSGid tar
 [ "$status" -eq 1 ]
}

@test "Ensure taskset hasn't SUID/GUID set" {
 run gotSGid taskset
 [ "$status" -eq 1 ]
}

@test "Ensure tclsh hasn't SUID/GUID set" {
 run gotSGid tclsh
 [ "$status" -eq 1 ]
}

@test "Ensure tcpdump hasn't SUID/GUID set" {
 run gotSGid tcpdump
 [ "$status" -eq 1 ]
}

@test "Ensure tee hasn't SUID/GUID set" {
 run gotSGid tee
 [ "$status" -eq 1 ]
}

@test "Ensure telnet hasn't SUID/GUID set" {
 run gotSGid telnet
 [ "$status" -eq 1 ]
}

@test "Ensure tftp hasn't SUID/GUID set" {
 run gotSGid tftp
 [ "$status" -eq 1 ]
}

@test "Ensure time hasn't SUID/GUID set" {
 run gotSGid time
 [ "$status" -eq 1 ]
}

@test "Ensure timeout hasn't SUID/GUID set" {
 run gotSGid timeout
 [ "$status" -eq 1 ]
}

@test "Ensure tmux hasn't SUID/GUID set" {
 run gotSGid tmux
 [ "$status" -eq 1 ]
}

@test "Ensure top hasn't SUID/GUID set" {
 run gotSGid top
 [ "$status" -eq 1 ]
}

@test "Ensure traceroute6.iputils hasn't SUID/GUID set" {
 run gotSGid traceroute6.iputils
 [ "$status" -eq 1 ]
}

@test "Ensure ul hasn't SUID/GUID set" {
 run gotSGid ul
 [ "$status" -eq 1 ]
}

@test "Ensure umount hasn't SUID/GUID set" {
 run gotSGid umount
 [ "$status" -eq 1 ]
}

@test "Ensure unexpand hasn't SUID/GUID set" {
 run gotSGid unexpand
 [ "$status" -eq 1 ]
}

@test "Ensure uniq hasn't SUID/GUID set" {
 run gotSGid uniq
 [ "$status" -eq 1 ]
}

@test "Ensure unshare hasn't SUID/GUID set" {
 run gotSGid unshare
 [ "$status" -eq 1 ]
}

@test "Ensure vi hasn't SUID/GUID set" {
 run gotSGid vi
 [ "$status" -eq 1 ]
}

@test "Ensure vim hasn't SUID/GUID set" {
 run gotSGid vim
 [ "$status" -eq 1 ]
}

@test "Ensure wall hasn't SUID/GUID set" {
 run gotSGid wall
 [ "$status" -eq 1 ]
}

@test "Ensure watch hasn't SUID/GUID set" {
 run gotSGid watch
 [ "$status" -eq 1 ]
}

@test "Ensure wget hasn't SUID/GUID set" {
 run gotSGid wget
 [ "$status" -eq 1 ]
}

@test "Ensure whois hasn't SUID/GUID set" {
 run gotSGid whois
 [ "$status" -eq 1 ]
}

@test "Ensure wish hasn't SUID/GUID set" {
 run gotSGid wish
 [ "$status" -eq 1 ]
}

@test "Ensure write hasn't SUID/GUID set" {
 run gotSGid write
 [ "$status" -eq 1 ]
}

@test "Ensure xargs hasn't SUID/GUID set" {
 run gotSGid xargs
 [ "$status" -eq 1 ]
}

@test "Ensure xxd hasn't SUID/GUID set" {
 run gotSGid xxd
 [ "$status" -eq 1 ]
}

@test "Ensure zip hasn't SUID/GUID set" {
 run gotSGid zip
 [ "$status" -eq 1 ]
}

@test "Ensure zsh hasn't SUID/GUID set" {
 run gotSGid zsh
 [ "$status" -eq 1 ]
}
