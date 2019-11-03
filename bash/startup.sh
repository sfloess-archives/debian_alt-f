#!/bin/bash

/etc/init.d/rsyslog         start
/etc/init.d/cron            start
/etc/init.d/rpcbind         start
#/etc/init.d/inetutils-inetd start
/etc/init.d/tftpd-hpa start
/etc/init.d/nfs-common      start
#/etc/init.d/autofs          start
/etc/init.d/ssh             start
/etc/init.d/cobblerd        start
/etc/init.d/apache2         start

mkdir -p /mnt/admin-ap/backups
mkdir -p /mnt/admin-ap/home
mkdir -p /mnt/admin-ap/nas
mkdir -p /mnt/admin-ap/root
mkdir -p /mnt/admin-ap/shared

mount admin-ap:/home        /mnt/admin-ap/home
mount admin-ap:/opt/backups /mnt/admin-ap/backups
mount admin-ap:/opt/nas     /mnt/admin-ap/nas
mount admin-ap:/opt/shared  /mnt/admin-ap/shared
mount admin-ap:/root        /mnt/admin-ap/root


