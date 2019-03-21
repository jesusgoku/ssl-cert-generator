#!/usr/bin/env sh

if [ -z "$1" ]; then
  DOMAIN="localhost"
else
  DOMAIN="$1"
fi

./createRootCA.sh "${DOMAIN}"
./createLocalDomainCSR.sh "${DOMAIN}"
./createLocalDomainCA.sh "${DOMAIN}"
