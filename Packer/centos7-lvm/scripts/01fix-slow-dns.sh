#!/bin/bash -eux

echo '==> Applying slow DNS fix'
echo 'RES_OPTIONS="single-request-reopen"' >> /etc/sysconfig/network
service network restart
echo '==> Slow DNS fix applied (single-request-reopen)'
