#!/bin/bash

#Formateo de particiones lv
sudo mkfs.ext4 /dev/vg_datos/lv_docker
sudo mkfs.ext4 /dev/vg_datos/lv_workareas

#Formateo de las memorias swap
sudo mkswap /dev/vg_temp/lv_swap
sudo mkswap /dev/sde1

sudo swapon /dev/vg_temp/lv_swap
sudo swapon /dev/sde1

#Creacion de la carpeta work
sudo mkdir -p /work/

#Agregado de particiones a la fstab
echo '/dev/vg_datos/lv_docker  /var/lib/docker/ ext4 defaults 0 2' | sudo tee -a /etc/fstab
echo '/dev/vg_datos/lv_workareas   /work/ ext4 defaults 0 2' | sudo tee -a /etc/fstab
echo '/dev/vg_temp/lv_swap none swap sw 0 0' | sudo tee -a /etc/fstab
echo '/dev/sde1 none swap sw 0 0' | sudo tee -a /etc/fstab

sudo systemctl daemon-reload
sudo mount -a

sudo systemctl enable --now docker

