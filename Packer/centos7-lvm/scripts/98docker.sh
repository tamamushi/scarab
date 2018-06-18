#!/bin/sh

echo "==> Run the Docker installation script"
PKG_NAME="docker-ce.x86_64"
echo $PKG_NAME
PKG=`yum list "${PKG_NAME}" | grep "${PKG_NAME}" | awk '{print "docker-ce-"$2}'`
echo $PKG
yum install -y ${PKG}

echo "==> Create the docker group"
# Add the docker group if it doesn't already exist
groupadd docker

echo "==> Add the connected "${USER}" to the docker group."
gpasswd -a ${USER} docker
gpasswd -a ${SSH_USERNAME} docker

usermod -aG docker ${SSH_USERNAME}

echo "==> Starting docker"
sudo systemctl start docker
echo "==> Enabling docker to start on reboot"
sudo systemctl enable docker
