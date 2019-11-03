#!/bin/bash

apt-get install -y rsyslog rpcbind inetutils-inetd nfs-common apache2 htop vim python3 git make python3-pip

apt-get install -y createrepo apache2 genisoimage libapache2-mod-wsgi libapache2-mod-ssl python-cheetah python-netaddr python-simplejson python-urlgrabber python-yaml rsync

apt-get install -y git make python3-dev python3-setuptools python3-cheetah openssl
apt-get install apache2-dev
apt-get install yum-utils tftpd-hpa
apt-get install libapache2-mod-wsgi-py3
apt-get install postfix alpine

pip3 install future distro coverage
pip3 install requests Django dnspython ldap3 mod_wsgi netaddr pymongo pyyaml simplejson tornado
pip3 install netaddr
pip3 install repo
pip3 install items

#----------------------------
# /etc/default/tftpd-hpa

# TFTP_OPTIONS="--secure --ipv4 --create --permissive"
#----------------------------

