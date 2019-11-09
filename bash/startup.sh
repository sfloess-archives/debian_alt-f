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

mkdir -p /mnt/cloud-ap/shared

mount cloud-ap:/opt/shared  /mnt/cloud-ap/shared

mkdir -p /mnt/redhat-laptop/root
mkdir -p /mnt/redhat-laptop/home

mount redhat-laptop:/root /mnt/redhat-laptop/root
mount redhat-laptop:/home /mnt/redhat-laptop/home

