#!/bin/bash
set -e

# dirty hack because linux
sudo bash -c "sleep 120"
sudo apt -q update
echo "apt-get update done."
sudo DEBIAN_FRONTEND=noninteractive apt -qy -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold"  upgrade
sudo apt install -qy python-dev python-pip openssh-server language-pack-en
sudo pip install --upgrade pip
sudo pip uninstall pyOpenSSL
sudo pip install pyOpenSSL==17.5.0
sudo pip install ansible
sudo timedatectl set-timezone Europe/London
sudo localectl set-locale LANG=en_GB.utf8
echo "Running build."
sudo ansible-playbook /home/ubuntu/playbook.yaml
