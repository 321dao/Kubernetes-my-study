git clone https://github.com/hx6007/Kubernetes-my-study.git 

cd && mkdir .ssh && cd .ssh/ && ssh-keygen -t rsa

ssh-copy-id -i /root/.ssh/id_rsa.pub root@192.168.224.144
ssh-copy-id -i /root/.ssh/id_rsa.pub root@192.168.224.143

scp -r Kubernetes-my-study root@192.168.224.144:/root/

master上

Kubernetes-my-study/master/0-ssh master需要和各个节点建立ssh互信

Kubernetes-my-study/master/certificate.sh 需要修改ip

Kubernetes-my-study/master/etcd 需要修改ip

Kubernetes-my-study/master/6-scp-pem.sh 需要修改ip


所有node上修改

Kubernetes-my-study/node1/etcd 需要修改ip



















