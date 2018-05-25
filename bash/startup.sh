#!/bin/bash

sed -i "s/^search\ .*/search flossware\.com/" /etc/resolv.conf

/etc/init.d/rsyslog         start
/etc/init.d/cron            start
/etc/init.d/rpcbind         start
/etc/init.d/inetutils-inetd start
/etc/init.d/nfs-common      start
/etc/init.d/nis             start
#/etc/init.d/autofs          start
/etc/init.d/ssh             start
/etc/init.d/cobblerd        start
/etc/init.d/apache2         start
#/etc/init.d/puppet-master   start
/etc/init.d/tftpd-hpa       start

mount -a

mount admin-ap:/home        /mnt/admin-ap/home
mount admin-ap:/opt/backups /mnt/admin-ap/backups
mount admin-ap:/opt/media   /mnt/admin-ap/media
mount admin-ap:/opt/nas     /mnt/admin-ap/nas
mount admin-ap:/opt/shared  /mnt/admin-ap/shared
mount admin-ap:/root        /mnt/admin-ap/root

mount redhat-laptop:/etc    /mnt/redhat-laptop/etc
mount redhat-laptop:/home   /mnt/redhat-laptop/home
mount redhat-laptop:/opt    /mnt/redhat-laptop/opt
mount redhat-laptop:/root   /mnt/redhat-laptop/root

