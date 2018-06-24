#!/bin/bash -eux
STAGE="[80develop_env.sh]"

USER=${SSH_USERNAME:-vagrant}
UHOME=${SSH_USERHOME:-/home/${USER}}
ANYENV_URL="git://github.com/riywo"
PYENV_URL="git://github.com/yyuu"

echo "==>${STAGE}: Installing anyenv "
git clone ${ANYENV_URL}/anyenv.git ${UHOME}/.anyenv/ >> /dev/null
git clone git://github.com/znz/anyenv-update.git ${UHOME}/.anyenv/plugins/anyenv-update >> /dev/null

chown -R ${USER} ${UHOME}/.anyenv
chgrp -R ${USER} ${UHOME}/.anyenv
chmod -R g+rwxXs ${UHOME}/.anyenv

echo 'export ANYENV_ROOT="$HOME/.anyenv"' >> ${UHOME}/.bash_profile
echo 'export PATH="$ANYENV_ROOT/bin:$PATH"' >> ${UHOME}/.bash_profile
echo 'eval "$(anyenv init -)"' >> ${UHOME}/.bash_profile

sudo -i -u ${USER} sh -c "anyenv install pyenv"
sudo -i -u ${USER} sh -c "git clone ${PYENV_URL}/pyenv-virtualenv ${UHOME}/.anyenv/envs/pyenv/plugins/pyenv-virtualenv"
sudo -i -u ${USER} sh -c "anyenv install rbenv"
sudo -i -u ${USER} sh -c "anyenv install ndenv"

## version check
PY_VERSION_3=`sudo -i -u ${USER} sh -c "pyenv install --list | grep -v - | grep -v b | grep '^  3.*' | tail -1"`
PY_VERSION_2=`sudo -i -u ${USER} sh -c "pyenv install --list | grep -v - | grep -v b | grep '^  2.*' | tail -1"`
RB_VERSION_2=`sudo -i -u ${USER} sh -c "rbenv install --list | grep -v - | grep -v b | grep '^  2.*' | tail -1"`
ND_VERSION_9=`sudo -i -u ${USER} sh -c "ndenv install --list | grep -v - | grep -v b | grep '^  v9.*' | tail -1"`

echo "==>${STAGE}: Installing development environment"
echo "==>${STAGE}: python-${PY_VERSION_3} python-${PY_VERSION_2} ruby-${RB_VERSION_2} node.js-${ND_VERSION_9}"

echo "==>${STAGE}: Installing python "
sudo -i -u ${USER} sh -c "pyenv install ${PY_VERSION_3}"
sudo -i -u ${USER} sh -c "pyenv install ${PY_VERSION_2}"

echo "==>${STAGE} Installing ruby "
sudo -i -u ${USER} sh -c "rbenv install ${RB_VERSION_2}"

echo "==>${STAGE} Installing nodejs "
sudo -i -u ${USER} sh -c "ndenv install ${ND_VERSION_9}"
