#!/bin/bash

if [ "$STAGE" = "production" ] ; then
    docker run --detach=false --publish=8000:8000 -e STAGE=$STAGE davidbrownza/bgf-service:latest
else
    docker run --detach=false --publish=8000:8000 -e STAGE=$STAGE -v $(pwd)/app:/srv/app davidbrownza/bgf-service:dev
fi