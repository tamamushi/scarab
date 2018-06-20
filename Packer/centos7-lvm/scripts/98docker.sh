#!/bin/sh

USER=${SSH_USERNAME:-vagrant}

echo "==> Run the Docker installation script"
yum install -y docker

echo "==> Create the docker group"
# Add the docker group if it doesn't already exist
sudo groupadd docker

echo "==> Add the connected "${USER}" to the docker group."
sudo gpasswd -a ${USER} docker
usermod -aG docker ${USER}

echo "==> Starting docker"
sudo systemctl start docker
echo "==> Enabling docker to start on reboot"
sudo systemctl enable docker
