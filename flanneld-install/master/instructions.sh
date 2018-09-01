#!/bin/bash
echo "验证"

cd /opt/kubernetes/ssl

/opt/kubernetes/bin/etcdctl \
--ca-file=ca.pem --cert-file=server.pem --key-file=server-key.pem \
--endpoints="https://192.168.224.142:2379,https://192.168.224.143:2379,https://192.168.224.144:2379" \
get /coreos.com/network/config


echo "查看路由表"
/opt/kubernetes/bin/etcdctl --ca-file=ca.pem --cert-file=server.pem --key-file=server-key.pem --endpoints="https://192.168.224.142:2379,https://192.168.224.143:2379,https://192.168.224.144:2379" ls /coreos.com/network/subnets

echo "获取节点的ip"
/opt/kubernetes/bin/etcdctl --ca-file=ca.pem --cert-file=server.pem --key-file=server-key.pem --endpoints="https://192.168.224.142:2379,https://192.168.224.143:2379,https://192.168.224.144:2379" get /coreos.com/network/subnets/172.17.85.0-24

echo "查看node宿主机路由表"
 route
