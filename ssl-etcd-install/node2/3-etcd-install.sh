#/bin/bash
cp etcd /opt/kubernetes/cfg/
cp etcd.service /usr/lib/systemd/system/
#wget https://github.com/etcd-io/etcd/releases/download/v3.3.9/etcd-v3.3.9-linux-amd64.tar.gz
cp ../soft/etcd-v3.3.9-linux-amd64.tar.gz ./
tar xvf etcd-v3.3.9-linux-amd64.tar.gz
cd etcd-v3.3.9-linux-amd64
mv etcd etcdctl /opt/kubernetes/bin/
ystemctl daemon-reload
systemctl enable etcd
systemctl start etcd
