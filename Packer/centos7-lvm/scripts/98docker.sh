#!/bin/sh
STAGE="[98docker.sh]"
USER=${SSH_USERNAME:-vagrant}

echo "==>${STAGE}: Run the Docker installation script"
yum install -y docker >> /dev/null

echo "==>${STAGE}: Create the docker group"
# Add the docker group if it doesn't already exist
sudo groupadd docker

echo "==>${STAGE}: Add the connected "${USER}" to the docker group."
sudo gpasswd -a ${USER} docker
usermod -aG docker ${USER}

echo "==>${STAGE}: Starting docker"
sudo systemctl start docker
echo "==>${STAGE}: Enabling docker to start on reboot"
sudo systemctl enable docker
