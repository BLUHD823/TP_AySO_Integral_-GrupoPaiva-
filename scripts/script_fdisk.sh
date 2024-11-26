#!/bin/bash

#Creacion de las diferentes particiones: 8e para las particiones normales y 82 para las swap

sudo systemctl stop docker
sudo fdisk /dev/sdc<<EOF
n
p



t

8e

w
EOF

sudo fdisk /dev/sdd<<EOF
n
p



t

8e
w
EOF

sudo fdisk /dev/sde<<EOF
n
p
1

+1G



t

82

w
EOF
