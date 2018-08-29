#!/bin/bash
scp -r /opt/kubernetes/cfg/ root@192.168.224.143:/opt/kubernetes/
scp -r /opt/kubernetes/cfg/ root@192.168.224.144:/opt/kubernetes/
scp -r /opt/kubernetes/bin/ root@192.168.224.143:/opt/kubernetes/
scp -r /opt/kubernetes/bin/ root@192.168.224.144:/opt/kubernetes/
scp -r /opt/kubernetes/ssl/ root@192.168.224.144:/opt/kubernetes/
scp -r /opt/kubernetes/ssl/ root@192.168.224.143:/opt/kubernetes/
scp /usr/lib/systemd/system/etcd.service root@192.168.224.143:/usr/lib/systemd/system/
scp /usr/lib/systemd/system/etcd.service root@192.168.224.144:/usr/lib/systemd/system/
