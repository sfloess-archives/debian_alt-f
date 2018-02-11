#!/bin/bash

/etc/init.d/rsyslog         start
/etc/init.d/cron            start
/etc/init.d/rpcbind         start
/etc/init.d/inetutils-inetd start
/etc/init.d/nfs-common      start
#/etc/init.d/autofs          start
/etc/init.d/ssh             start
/etc/init.d/cobblerd        start
/etc/init.d/apache2         start
/etc/init.d/puppet-master   start

mount -a
