#!/bin/bash

# ----------------------------------------------------------

apt-get install -y make git apache2 python-yaml python-cheetah python-netaddr python-simplejson python-urlgrabber libapache2-mod-wsgi python-django yum-utils lsb tftpd-hpa syslinux-common pxelinux isolinux genisoimage

# ----------------------------------------------------------

DEVELOPMENT_HOME=${HOME}/Development
GITHUB_HOME=${DEVELOPMENT_HOME}/github

# ----------------------------------------------------------

COBBLER_HOME=${GITHUB_HOME}/cobbler

mkdir -p ${COBBLER_HOME}
cd ${COBBLER_HOME}

git clone https://github.com/cobbler/cobbler.git

cd cobbler

git checkout release28

make install

# ----------------------------------------------------------

LIVECD_TOOLS_HOME=${GITHUB_HOME}/livecd-tools

mkdir -p ${LIVECD_TOOLS_HOME}
cd ${LIVECD_TOOLS_HOME}

git@github.com:livecd-tools/livecd-tools.git

cd livecd-tools

make install

# ----------------------------------------------------------

cd ${HOME}

# ----------------------------------------------------------

a2enmod proxy
a2enmod proxy_http
a2enmod rewrite

# ----------------------------------------------------------

mkdir -p /usr/share/syslinux/

# ----------------------------------------------------------

ln -s /etc/apache2/conf-available/cobbler.conf       /etc/apache2/conf-enabled/
ln -s /etc/apache2/conf-available/cobbler_web.conf   /etc/apache2/conf-enabled/

ln -s /usr/local/lib/python2.6/dist-packages/cobbler /usr/lib/python2.6/dist-packages/
ln -s /usr/local/lib/python2.7/dist-packages/cobbler /usr/lib/python2.7/dist-packages/ 

ln -s /usr/local/share/cobbler                       /usr/share

ln -s /usr/lib/PXELINUX/pxlinux.0                    /usr/lib/syslinux/
ln -s /usr/lib/syslinux/modules/bios/menu.c32        /usr/lib/syslinux/
ln -s /usr/lib/syslinux/modules/bios/ldlinux.c32     /usr/lib/syslinux/
ln -s /usr/lib/ISOLINUX/isolinux.bin                 /usr/lib/syslinux/
ln -s /usr/lib/syslinux/modules/bios/menu.c32        /var/lib/cobbler/loaders/
ln -s /usr/lib/syslinux/modules/bios/chain.c32       /usr/lib/syslinux/
ln -s /usr/lib/syslinux/modules/bios/libutil.c32     /usr/lib/syslinux/
ln -s /usr/lib/syslinux/modules/bios/libcom32.c32    /usr/share/syslinux/
ln -s /usr/lib/syslinux/modules/bios/libutil.c32     /usr/share/syslinux/

ln -s /usr/bin/genisoimage                           /usr/bin/mkisofs

# ----------------------------------------------------------

chown www-data /var/lib/cobbler/webui_sessions

# ----------------------------------------------------------

SECRET_KEY=$(python -c 'import re;from random import choice; import sys; sys.stdout.write(re.escape("".join([choice("abcdefghijklmnopqrstuvwxyz0123456789^&*(-_=+)") for i in range(100)])))') 

sed -i "s/^SECRET_KEY = .*/SECRET_KEY = '${SECRET_KEY}'/" /usr/local/share/cobbler/web/settings.py
sed -i "s/^SECRET_KEY = .*/SECRET_KEY = '${SECRET_KEY}'/" /usr/local/lib/python2.6/dist-packages/cobbler/web/settings.py
sed -i "s/^SECRET_KEY = .*/SECRET_KEY = '${SECRET_KEY}'/" /usr/local/lib/python2.7/dist-packages/cobbler/web/settings.py

# ----------------------------------------------------------

sed -i "s/^server: 127.0.0.1/server: 192.168.168.31/" /etc/cobbler/settings

# ----------------------------------------------------------

sed -i 's/--secure/--secure --ipv4/' /etc/defaults/tftpd-hpa

echo "Enter password for cobbler..."

htdigest /etc/cobbler/users.digest "Cobbler" cobbler

# ----------------------------------------------------------

service apache2   restart
service cobblerd  restart
service tftpd-hpa restart

# ----------------------------------------------------------

