#!/usr/bin/env bash
sed -i "s/^.*requiretty/#Defaults requiretty/" /etc/sudoers

echo '==> Turning off sshd DNS lookup to prevent timeout delay'
sed -i "s/#UseDNS yes/UseDNS no/" /etc/ssh/sshd_config

cat <<"EOM" | sudo tee /etc/yum.repos.d/epel.repo
[epel]
name=Extra Packages for Enterprise Linux 7 - $basearch
#baseurl=http://download.fedoraproject.org/pub/epel/7/$basearch
mirrorlist=https://mirrors.fedoraproject.org/metalink?repo=epel-7&arch=$basearch
failovermethod=priority
enabled=0
gpgcheck=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-7
EOM

sudo yum -y install gcc make automake autoconf libtool gcc-c++ kernel-devel-`uname -r` perl
sudo yum -y install openssl-devel zlib-devel realine-devel sqlite-devel wget bind-utils bzip2 git
sudo yum -y --enablerepo=epel install dkms

# Vagrant用の公開鍵を登録
echo '==> Configuring settings for vagrant'
mkdir -pm 700 /home/vagrant/.ssh
wget --no-check-certificate 'https://raw.githubusercontent.com/mitchellh/vagrant/master/keys/vagrant.pub' -O /home/vagrant/.ssh/authorized_keys
chmod 0600 /home/vagrant/.ssh/authorized_keys
chown -R vagrant /home/vagrant/.ssh

echo '==> Configuring sshd_config options'
echo '==> Disablng GSSAPI authentication to prevent timeout delay'
echo "GSSAPIAuthentication no" >> /etc/ssh/sshd_config
