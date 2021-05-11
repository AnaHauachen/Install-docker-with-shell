#!/bin/bash

sudo apt-get update >> /dev/null && echo "Pacotes Atualizados"
sudo apt-get install -y docker.io >> /dev/null && echo "Docker Instalado"

sudo service docker restart

echo "Baixando uma Imagem do Ubuntu"
sudo docker pull ubuntu:14.04


sudo docker run -itd --privileged --name=test ubuntu:14.04 /bin/bash

sudo docker exec test apt-get update
sudo docker exec test apt-get install -y iptables 
sudo docker exec test apt-get install -y net-tools 
sudo docker exec test apt-get install -y iputils-ping
sudo docker exec test apt-get install -y nano

sudo docker commit test ubuntu:1.0

sudo docker images

sudo docker rm -f $(docker ps -a -q)

sudo docker network create --driver bridge rede
sudo docker network create --driver bridge rede1








