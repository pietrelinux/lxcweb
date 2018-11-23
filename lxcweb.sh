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
apt-get -y install curl lxc
curl https://packagecloud.io/gpg.key | apt-key add -
apt-get -y update

#Instalamos el siguiente paquete para verificar repositorios
apt-get -y install debian-archive-keyring

#Instalamos para poder utilizar repositorios ubicamos en https, posiblemente
#ya estará instalado

apt-get install -y apt-transport-https

#Añadimos un repositorio ppa e introducimos lineas:
touch /etc/apt/sources.list.d/claudyus_LXC-Web-Panel.list
echo "deb https://packagecloud.io/claudyus/LXC-Web-Panel/ubuntu/ trusty main" > /etc/apt/sources.list.d/claudyus_LXC-Web-Panel.list
echo "deb-src https://packagecloud.io/claudyus/LXC-Web-Panel/ubuntu/ trusty main" > /etc/apt/sources.list.d/claudyus_LXC-Web-Panel.list

#Actualizamos los repositorios e instalamos lwp
apt-get -y update
apt-get -y install lwp

#Copiamos el fichero de configuracion
cp /etc/lwp/lwp.example.conf /etc/lwp/lwp.conf

#Reiniciamos el servicio:
service lwp restart

echo "Listo ya tienes instalado lwp"

