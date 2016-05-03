#!/bin/sh


if [ -z "$(vagrant version 2>&1 | grep 'Installed')" ]; then
	echo "Vagrantが入っていません！Vagrantをインストールして下さい。";
	exit 1;
fi

VAGRANT=`whereis vagrant`

${VAGRANT} plugin install dotenv

