#!/bin/bash
clear

###############################
#
# Parametros:
#  - Lista de Usuarios a crear
#  - Usuario del cual se obtendra la clave
#
#  Tareas:
#  - Crear los usuarios segun la lista recibida en los grupos descriptos
#  - Los usuarios deberan de tener la misma clave que la del usuario pasado por parametro
#
###############################

LISTA=$1
USUARIO_PARAMETRO=$2

ANT_IFS=$IFS
IFS=$'\n'
awk -F: '($3 >= 1000) {print $1}' /etc/passwd
for LINEA in `cat $LISTA |  grep -v ^#`
do
        USUARIO=$(echo $LINEA |awk -F ',' '{print $1}')
        GRUPO=$(echo $LINEA |awk -F ',' '{print $2}')
        DIRECTORIO=$(echo $LINEA |awk -F ',' '{print $3}')
        PASSWD=$(sudo grep $USUARIO_PARAMETRO /etc/shadow | awk -F ':' '{print $2}')
	mkdir -p $DIRECTORIO
        groupadd $GRUPO
	sudo useradd -m -s /bin/bash -d $DIRECTORIO -p $PASSWD -g $GRUPO $USUARIO
	groups $USUARIO
done
IFS=$ANT_IFS
awk -F: '($3 >= 1000) {print $1}' /etc/passwd
awk -F: '{print $1 ": " $6}' /etc/passwd

