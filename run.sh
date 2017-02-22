#!/bin/bash

readonly LOCAL_REPO=$(mktemp -d)
SETTINGS=${2:-"$(pwd)/settings.xml"}

if [ "${1}" = '-cache' ]; then
  SETTINGS="-s ${SETTINGS}"
else
  unset SETTINGS
fi

mvn clean install -Dmaven.repo.local="${LOCAL_REPO}" ${SETTINGS}
rm -rf "${LOCAL_REPO}" 'target'
