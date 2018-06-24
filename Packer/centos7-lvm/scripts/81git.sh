#!/bin/bash -eux

USER=${SSH_USERNAME:-vagrant}
UHOME=${SSH_USERHOME:-/home/${USER}}

VERSION="2.17.1"
GIT_REPO="https://mirrors.edge.kernel.org/pub/software/scm/git/git-${VERSION}.tar.gz"

echo "==> Installing anyenv "
PACKAGE="curl-devel expat-devel gettext-devel perl-ExtUtils-MakeMaker autoconf"
sudo yum remove git >> /dev/null
sudo yum -y install ${PACKAGE} >> /dev/null

cd /tmp && wget ${GIT_REPO} 
tar xvzf git-${VERSION}.tar.gz >>/dev/null
cd git-${VERSION} 
make configure 1>/dev/null
./configure --prefix=/usr 1>/dev/null
make all 1>/dev/null
sudo make install

echo -n "==> Installing git:  "
cd - && git --version
