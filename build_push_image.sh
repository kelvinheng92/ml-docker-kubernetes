#!/bin/bash
ADDRESS=gcr.io
PROJECT_ID=ml-docker-kubernetes
REPOSITORY=auto
VERSION=1.0.0

docker build -t ${PROJECT_ID}:${VERSION} .
ID="$(sudo docker images | grep ${PROJECT_ID} | head -n 1 | awk '{print $3}')"

docker tag ${ID} $ADDRESS/${PROJECT_ID}/${REPOSITORY}:${VERSION}

docker push $ADDRESS/${PROJECT_ID}/${REPOSITORY}:${VERSION}
