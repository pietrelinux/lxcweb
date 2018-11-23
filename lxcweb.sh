#!/bin/bash
locale-gen es_ES.UTF-8
export LC_ALL="es_ES.UTF-8"
update-locale LC_ALL=es_ES.UTF-8 LANG=es_ES.UTF-8 LC_MESSAGES=POSIX
dpkg-reconfigure locales
curl https://packagecloud.io/gpg.key | apt-key add -
#Añadimos un repositorio ppa e introducimos lineas:
touch /etc/apt/sources.list.d/claudyus_LXC-Web-Panel.list
echo "deb https://packagecloud.io/claudyus/LXC-Web-Panel/ubuntu/ xenial main" > /etc/apt/sources.list.d/claudyus_LXC-Web-Panel.list
echo "deb-src https://packagecloud.io/claudyus/LXC-Web-Panel/ubuntu/ xenial main" > /etc/apt/sources.list.d/claudyus_LXC-Web-Panel.list
apt-get -y update
apt-get -y upgrade -y

apt-get install lxc install curl debian-archive-keyring  apt-transport-https lwp -y

cp /etc/lwp/lwp.example.conf /etc/lwp/lwp.conf

#Reiniciamos el servicio:
service lwp restart

