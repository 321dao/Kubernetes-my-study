#!/bin/bash
mkdir ssl && cd ssl
#wget https://pkg.cfssl.org/R1.2/cfssl_linux-amd64 
#wget https://pkg.cfssl.org/R1.2/cfssljson_linux-amd64
#wget https://pkg.cfssl.org/R1.2/cfssl-certinfo_linux-amd64
#chmod +x * 
mv ../soft/cfssl-certinfo_linux-amd64  /usr/local/bin/cfssl-certinfo   
mv ../soft/cfssljson_linux-amd64     /usr/local/bin/cfssljson
mv ../soft/cfssl_linux-amd64       /usr/local/bin/cfssl
$(which sh) ../certificate.sh
ls | grep -v pem | xargs -i rm {}
mkdir -p /opt/kubernetes/{bin,cfg,ssl}
cp *pem /opt/kubernetes/ssl
