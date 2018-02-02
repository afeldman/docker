#!/bin/sh

echo "http://mirror.yandex.ru/mirrors/alpine/$1/main" > /etc/apk/repositories
echo "http://mirror.yandex.ru/mirrors/alpine/$1/community" >>  /etc/apk/repositories
echo "http://mirror1.hs-esslingen.de/pub/Mirrors/alpine/$1/main" >> /etc/apk/repositories
echo "http://mirror1.hs-esslingen.de/pub/Mirrors/alpine/$1/community" >> /etc/apk/repositories

if [ $1 == 'edge' ]; then
  echo "http://mirror.leaseweb.com/alpine/edge/testing" >> /etc/apk/repositories
  echo "http://mirror1.hs-esslingen.de/pub/Mirrors/alpine/edge/testing" >> /etc/apk/repositories
fi

cat /etc/apk/repositories
