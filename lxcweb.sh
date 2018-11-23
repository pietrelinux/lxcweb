#!/bin/bash

#Actualizamos los repositorios y los paquetes
export LANG=C
apt-get update -y
apt-get upgrade -y
locale-gen es_ES.UTF-8
export LC_ALL="es_ES.UTF-8"
update-locale LC_ALL=es_ES.UTF-8 LANG=es_ES.UTF-8 LC_MESSAGES=POSIX
dpkg-reconfigure locales
#Instalamos curl y añadimos la clave publica
apt-get -y install curl lxc debian-archive-keyring libvirt-clients debootstrap rsync apt-transport-https

