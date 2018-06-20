#!/bin/bash -eux

USER=${SSH_USERNAME:-vagrant}
UHOME=${SSH_USERHOME:-/home/${USER}}
ANYENV_URL="git://github.com/riywo"
PYENV_URL="git://github.com/yyuu"

echo "==> Installing anyenv "
git clone ${ANYENV_URL}/anyenv.git ${UHOME}/.anyenv/
git clone git://github.com/znz/anyenv-update.git ${UHOME}/.anyenv/plugins/anyenv-update

chown -R ${USER} ${UHOME}/.anyenv
chgrp -R ${USER} ${UHOME}/.anyenv
chmod -R g+rwxXs ${UHOME}/.anyenv

echo 'export ANYENV_ROOT="$HOME/.anyenv"' >> ${UHOME}/.bash_profile
echo 'export PATH="$ANYENV_ROOT/bin:$PATH"' >> ${UHOME}/.bash_profile
echo 'eval "$(anyenv init -)"' >> ${UHOME}/.bash_profile

echo "==> Installing pyenv"
sudo -i -u ${USER} sh -c "anyenv install pyenv"
sudo -i -u ${USER} sh -c "git clone ${PYENV_URL}/pyenv-virtualenv ${UHOME}/.anyenv/envs/pyenv/plugins/pyenv-virtualenv"

echo "==> Installing rbenv"
sudo -i -u ${USER} sh -c "anyenv install rbenv"

echo "==> Installing ndenv"
sudo -i -u ${USER} sh -c "anyenv install ndenv"

echo "==> Installing python "
VERSION_3=`sudo -i -u ${USER} sh -c "pyenv install --list | grep -v - | grep -v b | grep '^  3.*' | tail -1"`
VERSION_2=`sudo -i -u ${USER} sh -c "pyenv install --list | grep -v - | grep -v b | grep '^  2.*' | tail -1"`

sudo -i -u ${USER} sh -c "pyenv install ${VERSION_3}"
sudo -i -u ${USER} sh -c "pyenv install ${VERSION_2}"

echo "==> Installing ruby "
VERSION_2=`sudo -i -u ${USER} sh -c "rbenv install --list | grep -v - | grep -v b | grep '^  2.*' | tail -1"`

sudo -i -u ${USER} sh -c "rbenv install ${VERSION_2}"

echo "==> Installing nodejs "
VERSION_9=`sudo -i -u ${USER} sh -c "ndenv install --list | grep -v - | grep -v b | grep '^  v9.*' | tail -1"`

sudo -i -u ${USER} sh -c "ndenv install ${VERSION_9}"
