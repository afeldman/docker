#!/usr/bin/env sh

set -e

if [ -z ${SERVER} ] 
   echo "server not set in env variable"
   exit 1
fi

if [ -z ${MOINT_POINT} ] 
   echo "mount point not set in env variable"
   exit 1
fi

nsenter -t -l -m -u -i -n sh -c " \   
    mkdir -p ${MOUNT_POINT} \
    && (umount ${MOUNT_POINT} || /bin/true) \
    && mount -t cifs ${SERVER} ${MOUNT_POINT} -o ${OPTIONS}\
    && inotofy -m ${MOUNT_POINT}\
"
