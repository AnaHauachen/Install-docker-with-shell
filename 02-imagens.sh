#!/bin/bash

sudo docker run -itd --privileged --name=Cliente -h Cliente --net rede ubuntu:1.0 /bin/bash
sudo docker run -itd --privileged --name=Firewall -h Firewall --net rede ubuntu:1.0 /bin/bash

sudo docker run -itd --privileged --name=Internet-Servidor -h Internet-Servidor ubuntu:1.0 /bin/bash


sudo docker network connect rede1 Firewall
sudo docker network connect rede1 Internet-Servidor


sudo docker exec Cliente ifconfig eth0 0
sudo docker exec Cliente ifconfig eth0 192.168.0.1/24

sudo docker exec Firewall ifconfig eth0 0 
sudo docker exec Firewall ifconfig eth1 0 
sudo docker exec Firewall ifconfig eth0 192.168.0.2/24
sudo docker exec Firewall ifconfig eth1 10.0.0.1/24

sudo docker exec Internet-Servidor ifconfig eth1 0
sudo docker exec Internet-Servidor ifconfig eth1 10.0.0.2/24