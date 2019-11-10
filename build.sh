#!/bin/bash

REPO="efirestone"
IMAGE_NAME="node-red-ha"

# Use the same version as the actual Node Red docker image
re="^FROM\s[^:]*:([^\s]*)^"
[[ $(cat "./Dockerfile") =~ $re ]]
VERSION=${BASH_REMATCH[1]}

LOCAL_IMAGE_NAME="$IMAGE_NAME-$VERSION"
docker build ./ -t $LOCAL_IMAGE_NAME

REPO_WITH_TAG="$REPO/$IMAGE_NAME:$VERSION"
docker tag $LOCAL_IMAGE_NAME $REPO_WITH_TAG
docker push $REPO_WITH_TAG

REPO_WITH_TAG="$REPO/$IMAGE_NAME:latest"
docker tag $LOCAL_IMAGE_NAME $REPO_WITH_TAG
docker push $REPO_WITH_TAG
