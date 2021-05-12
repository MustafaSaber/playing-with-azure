#!/bin/bash

set -e
set -x

REGISTERY_NAME=$1
IMAGE_NAME=$2

docker logout

TOKEN=$(az acr login --name intouch --expose-token --output tsv --query accessToken)

docker login intouch.azurecr.io --username 00000000-0000-0000-0000-000000000000 --password $TOKEN

docker build -t $REGISTERY_NAME.azurecr.io/$IMAGE_NAME .

docker push $REGISTERY_NAME.azurecr.io/$IMAGE_NAME