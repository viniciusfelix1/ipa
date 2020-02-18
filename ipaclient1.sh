#!/bin/bash
# Permite já cair como root no login
echo "sudo su -" >> /home/vagrant/.bashrc

hostnamectl set-hostname ipaclient1.example.local
echo -e "172.16.10.10\tipa.example.local\t ipa\n172.16.10.20\tipaclient1.example.local\t ipaclient1" >> /etc/hosts


yum install epel-release -y
yum update -y
yum install ipa-client -y

ipa-client-install --server=ipa.example.local --domain=example.local --mkhomedir --force-ntpd << EOF
yes
yes
admin
ipa4linux
EOF
