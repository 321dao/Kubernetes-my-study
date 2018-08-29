#/bin/bash
cp etcd /opt/kubernetes/cfg/
cp etcd.service /usr/lib/systemd/system/
#wget https://github.com/etcd-io/etcd/releases/download/v3.3.9/etcd-v3.3.9-linux-amd64.tar.gz
cp ../soft/etcd-v3.3.9-linux-amd64.tar.gz ./
tar xvf etcd-v3.3.9-linux-amd64.tar.gz
cd etcd-v3.3.9-linux-amd64
mv etcd etcdctl /opt/kubernetes/bin/
echo "export K8S_HOME=/opt/kubernetes" >> /etc/profile
echo "export PATH=\$PATH:\${K8S_HOME}/bin" >> /etc/profile
source /etc/profile
systemctl daemon-reload
systemctl enable etcd
systemctl start etcd


