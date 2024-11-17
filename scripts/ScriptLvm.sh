#!/bin/bash
sudo systemctl stop docker
sudo fdisk /dev/sdc<<EOF
n
p



p
w
EOF

sudo fdisk /dev/sdd<<EOF
n
p



p
w
EOF

sudo fdisk /dev/sde<<EOF
n
p

+1G


p
t
1
82

w
EOF

sudo mkdir -p /work/

#Creacion de pvs
sudo pvcreate /dev/sdc1
sudo pvcreate /dev/sdd1

#Creacion de vgs
sudo vgcreate vg_datos /dev/sdc1
sudo vgcreate vg_temp /dev/sdd1

sudo lvcreate -L 10M vg_datos -n lv_docker
sudo lvcreate -L 2.5G vg_datos -n lv_workareas
sudo lvcreate -L 2.5G vg_temp -n lv_swap

sudo mkfs.ext4 /dev/vg_datos/lv_docker
sudo mkfs.ext4 /dev/vg_datos/lv_workareas
sudo mkswap /dev/vg_temp/lv_swap
sudo mkswap /dev/sde1

sudo swapon /dev/vg_temp/lv_swap
sudo swapon /dev/sde1

echo '/dev/vg_datos/lv_docker  /var/lib/docker/ ext4 defaults 0 2' | sudo tee -a /etc/fstab
echo '/dev/vg_datos/lv_workareas   /work/ ext4 defaults 0 2' | sudo tee -a /etc/fstab
echo '/dev/vg_temp/lv_swap none swap sw 0 0' | sudo tee -a /etc/fstab
echo '/dev/sde1 none swap sw 0 0' | sudo tee -a /etc/fstab

sudo mount -a

sudo systemctl status docker
