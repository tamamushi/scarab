#!/bin/bash
# http://www.opscode.com/chef/install

INSTALL_ARGS=""

if [ "${CHEF_VERSION}" != "latest" ]; then
    INSTALL_ARGS="-v ${CHEF_VERSION}"
fi

curl -LO https://www.opscode.com/chef/install.sh
bash ./install.sh "${INSTALL_ARGS}"
rm install.sh
