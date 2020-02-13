#!/bin/sh

if lsblk | grep '^sdc.*5G'; then
  mv /home/vagrant/.ssh /root/vagrant-ssh

  fdisk -u /dev/sdc <<EOF
n
p
1

+500M
n
p
2

+500M
n
p
3

+500M
n
p
4

+500M
w
EOF

  mkfs.xfs /dev/sdc1
  mkfs.xfs /dev/sdc2
  mkfs.xfs /dev/sdc3
  mkfs.xfs /dev/sdc4

  mkdir -p /var/log/audit
  mkdir -p /var/lib/docker

  {
    echo '/dev/sdc1 /var/log xfs defaults 0 0'
    echo '/dev/sdc2 /var/log/audit xfs defaults 0 0'
    echo '/dev/sdc3 /home xfs defaults 0 0'
    echo '/dev/sdc4 /var/lib/docker xfs defaults 0 0'
  } >> /etc/fstab

  mount -t xfs /dev/sdc1 /var/log
  mount -t xfs /dev/sdc2 /var/log/audit
  mount -t xfs /dev/sdc3 /home
  mount -t xfs /dev/sdc4 /var/lib/docker

  if grep '^vagrant' /etc/passwd; then
    mkdir -p /home/vagrant
    mv /root/vagrant-ssh /home/vagrant/.ssh
    chown -R vagrant:vagrant /home/vagrant
    chmod 0750 /home/vagrant
    chmod 0700 /home/vagrant/.ssh
    chmod 0600 /home/vagrant/.ssh/*
  fi
fi
