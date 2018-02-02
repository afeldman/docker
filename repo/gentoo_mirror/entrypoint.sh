#!/bin/sh

rsync --recursive \
      --links --safe-links \
      --perms --times \
      --omit-dir-times --compress\
      --stats --human-readable\
      --progress --timeout=180\
      ${SERVER} /gentoo

if [ "$1" = 'rsyncd' ]; then
    echo "[Run] Starting rsyncd"

    exec /usr/bin/rsync --no-detach --daemon --config /etc/rsyncd.conf
fi

echo "[RUN]: Builtin command not provided [rsyncd]"
echo "[RUN]: $*"

exec "$@"
