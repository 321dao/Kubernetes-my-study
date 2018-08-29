#!/bin/bash
sudo yum install -y yum-utils device-mapper-persistent-data lvm2
sudo yum-config-manager --add-repo http://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo
sudo yum install docker-ce -y
systemctl enable  docker
systemctl daemon-reload
sudo service docker start
service docker status

 cat >> /etc/docker/daemon.json << eof
{
  "registry-mirrors": ["https://registry.docker-cn.com"],
  "insecure-registries": ["192.168.224.142:5000"]
}
eof



systemctl start docker
systemctl enable docker


