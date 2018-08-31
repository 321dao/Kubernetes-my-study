#!/bin/bash

hostname k8s-node-2
echo k8s-node-2 > /etc/hostname

sed -i 's/enforcing/disabled/g' /etc/selinux/config
setenforce 0
iptables -F
iptables -t nat -F
iptables -I FORWARD -s 0.0.0.0/0 -d 0.0.0.0/0 -j ACCEPT  
iptables -A INPUT -p tcp -m state --state NEW -m tcp --dport 2379 -j ACCEPT
iptables -A INPUT -p tcp -m state --state NEW -m tcp --dport 2380 -j ACCEPT

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


cp etcd /opt/kubernetes/cfg/
cp etcd.service /usr/lib/systemd/system/

echo "export K8S_HOME=/opt/kubernetes" >> /etc/profile
echo "export PATH=\$PATH:\${K8S_HOME}/bin" >> /etc/profile
source /etc/profile
systemctl daemon-reload
systemctl enable etcd
systemctl start etcd


