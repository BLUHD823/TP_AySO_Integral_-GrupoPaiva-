#!/bin/bash

#Creacion de pvs
sudo pvcreate /dev/sdc1 /dev/sdd1

#Creacion de vgs
sudo vgcreate vg_datos /dev/sdc1
sudo vgcreate vg_temp /dev/sdd1

#Creacion de lvm
sudo lvcreate -L 10M vg_datos -n lv_docker
sudo lvcreate -L 2.5G vg_datos -n lv_workareas
sudo lvcreate -L 2.5G vg_temp -n lv_swap


