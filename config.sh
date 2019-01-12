#!/bin/bash

systemctl stop NetworkManager.service
systemctl disable NetworkManager.service
systemctl enable network.service
systemctl start network.service

# Now we can get ready to install cPanel

yum -y install nano
yum -y install perl

# Now we can install cPanel

cd /home
curl -o latest -L https://securedownloads.cpanel.net/latest
sh latest

# Now we can install CSF

cd /usr/src
rm -fv csf.tgz
wget https://download.configserver.com/csf.tgz
tar -xzf csf.tgz
cd csf
sh install.sh

# Now we can install Softaculous
cd /home
wget -N http://files.softaculous.com/install.sh
chmod 755 install.sh
./install.sh

# Now I can delete this script

echo "Well nothing blew up, that's a good start!"

rm -- "$0"
