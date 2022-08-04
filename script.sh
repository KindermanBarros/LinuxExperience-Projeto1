#!/bin/bash

echo "Atualizando Apps..."

apt update -y
apt upgrade -y
apt-get install openssl
apt-get install wget
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "Criando diretórios..."

mkdir /publico
mkdir /adm
mkdir /ven
mkdir /sec

echo "Criando grupos de usuários..."

groupadd GRP_ADM
groupadd GRP_VEN
groupadd GRP_SEC

echo "Criando usuários..."

useradd kinderman -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_ADM
useradd lais -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_ADM
useradd joao -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_ADM

useradd dayane -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_VEN
useradd pedro -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_VEN
useradd isabel -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_VEN

useradd krishna -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_SEC
useradd roberto -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_SEC
useradd maria -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_SEC

echo "Especificando permissões dos diretórios...."

chown root:GRP_ADM /adm
chown root:GRP_VEN /ven
chown root:GRP_SEC /sec

chmod 770 /adm
chmod 770 /ven
chmod 770 /sec
chmod 777 /publico

echo "Finalizada Criação"