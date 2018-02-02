#!/bin/sh

## download data

RSYNC="/usr/bin/rsync"
OPTS="--recursive --links --perms --safe-links --times --omit-dir-times --compress --stats --human-readable --progress --timeout=300 "

echo "Started update at" `date`

${RSYNC} ${OPTS} ${SERVER} ${DST}

echo "End: "`date`




############################## Start rsync service

if [ "$1" = 'rsyncd' ]; then
    echo "[Run] Starting rsyncd"

    exec /usr/bin/rsync --no-detach --daemon --config /etc/rsyncd.conf
fi

echo "[RUN]: Builtin command not provided [rsyncd]"
echo "[RUN]: $*"

exec "$@"
