#!/bin/bash
#
# INIT - systemd, pure
# as per the Arch Linux wiki page on systemd: https://wiki.archlinux.org/index.php/Systemd

_installpkg systemd systemd-sysvcompat

# NOT NEEDED IN PURE SYSTEMD MODE
# KERNEL_PARAMS="${KERNEL_PARAMS:+${KERNEL_PARAMS} }init=/bin/systemd"

systemctl enable syslog-ng.service

# persistent journal, self limits to default 10% of volume capacity
# https://wiki.archlinux.org/index.php/Systemd#Systemd_Journal
mkdir -p /var/log/journal