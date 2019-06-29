#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

if [ "$STAGE" = "production" ] ; then
    docker build -t davidbrownza/bgf-service:latest . -f ${DIR}/Dockerfile.prod
else
    docker build -t davidbrownza/bgf-service:dev . -f ${DIR}/Dockerfile.dev
fi