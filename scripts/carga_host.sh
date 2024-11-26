#!/bin/bash

#Agrega las ip de las maquinas al archivo hosts

echo "192.168.56.4 vmHost1" | sudo tee -a /etc/hosts
echo "192.168.56.108 vmHost2" | sudo tee -a /etc/hosts
