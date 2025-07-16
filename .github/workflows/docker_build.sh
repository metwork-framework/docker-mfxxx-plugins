#!/bin/bash

#set -eu
set -x

docker pull $IMAGE 2>/dev/null
HASH_BEFORE=`docker images -q $IMAGE` 
docker build -t $IMAGE --build-arg BRANCH=$BRANCH --build-arg REPO=$REPO --build-arg ROCKY=$ROCKY --build-arg ROCKY_NUMBER=$ROCKY_NUMBER --build-arg CACHEBUST=$CACHEBUST .
HASH_AFTER=`docker images -q $TAG_BRANCH`
if [ "${HASH_BEFORE}" != "${HASH_AFTER}" ]; then
    docker push $TAG_BRANCH
fi
