#!/bin/bash
sudo usermod -a -G docker $(whoami)
sudo systemctl enable --now docker
sudo apt install docker-compose

docker-compose -f docker/docker-compose.yml up -d

