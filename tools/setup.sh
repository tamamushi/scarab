#!/bin/sh

PACKER_REPO="https://github.com/hashicorp/packer.git"
PACKER_URL="https://releases.hashicorp.com/packer"

## Extract packer version
_VERSION=`git ls-remote --tags ${PACKER_REPO} | awk -F'/' '{print $3}' | grep -v '\^{}' | sort -n | tail -1`
VERSION=`echo ${_VERSION} | awk '{print substr($0, 2)}'`

_RESULT=$(whereis wget) 
GETCMD=${_RESULT:="$(whereis curl) -O"}

echo $(whereis wget) || test

## operation system checking
if [ "$(uname)" == 'Darwin' ]; then 
	PACKER_BINARY="packer_${VERSION}_darwin_amd64.zip";
elif [ "$(expr substr $(uname -s) 1 5)" == 'Linux' ]; then
	PACKER_BINARY="packer_${VERSION}_linux_amd64.zip";
else
  echo "Your platform ($(uname -a)) is not supported."
  exit 1
fi
PACKER_ARCHIVE="${PACKER_URL}/${VERSION}/${PACKER_BINARY}"

## wget or curl needed for download binary
if [ ! "${GETCMD}" ]; then
	echo "wget or curl didn't install on this machine!"
	exit 1
fi

echo "download packer binary from ${PACKER_ARCHIVE}"
cd /tmp && ${GETCMD} ${PACKER_ARCHIVE}
tar xvzf ${PACKER_BINARY} 
echo "move packer binary to /usr/local/bin directory"
mv packer /usr/local/bin/packer
sudo chown root /usr/local/bin/packer

## clean up
rm -rf ${PACKER_BINARY}

which packer
