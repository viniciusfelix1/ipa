#!/bin/bash
# Permite já cair como root no login
echo "sudo su -" >> /home/vagrant/.bashrc

hostnamectl set-hostname ipaclient2.example.local
echo -e "172.16.10.10\tipa.example.local\t ipa\n172.16.10.21\tipaclient2.example.local\t ipaclient2" >> /etc/hosts

apt update
export $DEBIAN_FRONTEND=noninteractive
apt install freeipa-client -y

ipa-client-install --server=ipa.example.local --domain=example.local --mkhomedir --force-ntpd << EOF
yes
yes
admin
ipa4linux
EOF
