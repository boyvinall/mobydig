#!/bin/bash
#set -e

MODULE="scap"
SYSDIG_HOST_ROOT=/host

if lsmod | grep "$MODULE" &> /dev/null ; then
  echo "Module $MODULE is loaded!"
else
  echo "Module $MODULE is not loaded!, loading"
  insmod /scap.ko
fi

ln -s /host/var/run/docker.sock /run/docker.sock

exec "$@"
