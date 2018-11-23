 Manuel Franco   sysadmin   27 septiembre, 2017  1 Minute
Esta interfaz está disponible para Ubuntu 12.04 en adelante y es incompatible con Debian, pero, he encontrado un “fork” que si funciona en diferentes distribuciones entre ellas mi distro: Debian. Esta rama, tiene más funcionalidad y correcciones de fallos.

Instalación en Debian Stretch
Script de instalación y comentarios sobre las instrucciones:

#!/bin/bash

#Actualizamos los repositorios y los paquetes
apt-get -y update
apt-get -y upgrade

#Instalamos curl y añadimos la clave publica
apt-get -y install curl
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

