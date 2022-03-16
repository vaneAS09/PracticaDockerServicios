#!/bin/bash

sudo apt-get install -y
sleep 10
sudo apt-get install lxd -y
sleep 10
lxd --version
newgrp lxd
sudo lxd init --auto
sleep 20
#lxc remote add images images.linuxcontainers.org
sudo lxc launch ubuntu:20.04 dockerlxd
sleep 20
#lxc config set dockerlxd security.privileged true
sudo lxc config set dockerlxd limits.memory 64MB
sleep 10
lxc restart dockerlxd
lxc image list
lxc list
lxc info dockerlxd | more
lxc config show dockerlxd
sudo apt install net-tools
systemctl status apache2
lxc exec dockerlxd -- apt update
lxc exec dockerlxd -- apt install docker.io -y
lxc file push /home/vagrant/index.html dockerlxd/root/index.html
lxc file push /home/vagrant/Dockerfile dockerlxd/root/Dockerfile
lxc exec dockerlxd -- docker build -t vane/dockerlxd .
lxc exec dockerlxd -- docker run --name vanelxd -d -p 9000:80 vane/dockerlxd
lxc info dockerlxd | more
ifconfig | more
lxc config device add dockerlxd myport80 proxy listen=tcp:192.168.100.6:5080 connect=tcp:127.0.0.1:9000
sudo lsof -i | grep 5080