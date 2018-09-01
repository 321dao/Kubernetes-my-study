#!/bin/bash
tar xvf flannel-v0.9.1-linux-amd64.tar.gz

scp flanneld mk-docker-opts.sh root@192.168.224.143:/opt/kubernetes/bin/
scp flanneld mk-docker-opts.sh root@192.168.224.144:/opt/kubernetes/bin/


cd /opt/kubernetes/ssl/

/opt/kubernetes/bin/etcdctl \
--ca-file=ca.pem --cert-file=server.pem --key-file=server-key.pem \
--endpoints="https://192.168.224.142:2379,https://192.168.224.143:2379,https://192.168.224.144:2379" \
set /coreos.com/network/config '{ "Network": "172.17.0.0/16", "Backend": {"Type": "vxlan"}}'

 iptables -I INPUT -s 192.168.0.0/24 -j ACCEPT
