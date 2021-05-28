#!/bin/bash

groupId=$(az group show --name dev-resources --query id --output tsv)

az ad sp create-for-rbac --scope $groupId --role Contributor --sdk-auth > sp_secret.sh

registryId=$(az acr show --name intouch --query id --output tsv)

ClientId_in_SP_Secret=$(jq .clientId sp_secret.json)

az role assignment create \
  --assignee $ClientId_in_SP_Secret \
  --scope $registryId \
  --role AcrPush