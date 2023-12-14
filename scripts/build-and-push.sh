#!/bin/bash

# usage ./build.sh [build]
# no param: build and push docker image
# build: only builds docker image

set -ex

LAST_COMMIT_DT=$(git log -1 --format="%at" | xargs -I{} date -d @{} +%Y.%m.%d-%H.%M.%S)
DEPLOYMENT_TAG=main:${LAST_COMMIT_DT}
REGISTRY_DOMAIN=ghcr.io
REGISTRY=${REGISTRY_DOMAIN}/rhrlima/fs-ci-tests

docker build -t ${REGISTRY}/${DEPLOYMENT_TAG} .

if [ "$1" == "build" ]; then
    exit 0
fi

docker push ${REGISTRY}/${DEPLOYMENT_TAG}
