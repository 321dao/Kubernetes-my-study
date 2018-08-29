#!/bin/bash
yum -y install wget lrzsz mlocate deltarpm 
updatedb
cd /etc/yum.repos.d/
mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.backup 
wget -O /etc/yum.repos.d/CentOS-Base.repo  http://mirrors.163.com/.help/CentOS7-Base-163.repo
yum clean all
yum makecache
hostname k8s-node-2
echo k8s-node-2 > /etc/hostname

sed -i 's/enforcing/disabled/g' /etc/selinux/config
setenforce 0
iptables -F
iptables -t nat -F
iptables -I FORWARD -s 0.0.0.0/0 -d 0.0.0.0/0 -j ACCEPT  
iptables -A INPUT -p tcp -m state --state NEW -m tcp --dport 2379 -j ACCEPT
iptables -A INPUT -p tcp -m state --state NEW -m tcp --dport 2380 -j ACCEPT


