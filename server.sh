#!/bin/bash
# Permite já cair como root no login
echo "sudo su -" >> /home/vagrant/.bashrc

# Define o hostname do servidor e atualiza o mapeamento no hosts
hostnamectl set-hostname ipa.example.local
echo -e "172.16.10.10\tipa.example.local\t ipa" >> /etc/hosts

# Habilita repo epel e instala pacotes do IPA
yum install epel-release -y
yum update -y
yum install ipa-server ipa-server-dns -y

# Configurando o IPA
ipa-server-install << EOF
yes



directory4linux
directory4linux
ipa4linux
ipa4linux
yes
no
8.8.8.8
8.8.4.4

yes
yes

yes
EOF

# Alguns ajustes no IPA
systemctl enable ipa
authconfig --enablemkhomedir --update
