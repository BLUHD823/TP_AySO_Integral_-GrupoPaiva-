#!/bin/bash
mkdir -p {alta_usuarios,check_url}

touch alta_usuarios/alta_usuarios.sh
touch alta_usuarios/Lista_Usuarios.txt

touch check_url/check_URL.sh
touch check_url/Lista_URL.txt
touch README.md

sudo chmod +x alta_usuarios/alta_usuarios.sh
sudo chmod +x check_url/check_URL.sh
