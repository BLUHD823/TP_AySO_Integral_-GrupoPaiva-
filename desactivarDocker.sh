#!/bin/bash
docker ps
docker-compose -f ./docker/docker-compose.yml down
sudo systemctl stop docker
sudo systemctl disable docker
sudo systemctl status docker
