#!/bin/bash

hostname k8s-master
echo k8s-master > /etc/hostname

sed -i 's/enforcing/disabled/g' /etc/selinux/config
setenforce 0
iptables -F
iptables -t nat -F
iptables -I FORWARD -s 0.0.0.0/0 -d 0.0.0.0/0 -j ACCEPT  
iptables -A INPUT -p tcp -m state --state NEW -m tcp --dport 2379 -j ACCEPT
iptables -A INPUT -p tcp -m state --state NEW -m tcp --dport 2380 -j ACCEPT

mv ../soft/cfssl-certinfo_linux-amd64  /usr/local/bin/cfssl-certinfo   
mv ../soft/cfssljson_linux-amd64     /usr/local/bin/cfssljson
mv ../soft/cfssl_linux-amd64       /usr/local/bin/cfssl
cd ssl
$(which sh) certificate.sh
ls | grep -v pem | xargs -i rm {}
mkdir -p /opt/kubernetes/{bin,cfg,ssl}
cp *pem /opt/kubernetes/ssl

cd ..
cp etcd /opt/kubernetes/cfg/
cp etcd.service /usr/lib/systemd/system/
cd etcd-v3.3.9-linux-amd64
mv etcd etcdctl /opt/kubernetes/bin/
echo "export K8S_HOME=/opt/kubernetes" >> /etc/profile
echo "export PATH=\$PATH:\${K8S_HOME}/bin" >> /etc/profile
source /etc/profile
systemctl daemon-reload
systemctl enable etcd
systemctl start etcd
