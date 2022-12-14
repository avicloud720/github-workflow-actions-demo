#!/bin/sh -l

echo "Connecting to MongoDB Atlas......"
atlas --version

echo "\n============Configuration Setup==============="
atlas config set public_api_key $MONGO_ATLAS_PUB_API_KEY
atlas config set private_api_key $MONGO_ATLAS_PRIV_API_KEY
atlas config set project_id $MONGO_ATLAS_PROJECT_ID
atlas config set org_id $MONGO_ATLAS_ORG_ID

atlas accessList create --currentIp
atlas accessLists create $1

sleep 30

atlas projects apiKeys create

# atlas organizations apiKeys accessLists create --apiKey 62f5ff28a3c1c03dd24ddf10 --ip $1

sleep 30

echo "\n============Cluster List==============="
clusters_list=`atlas clusters list`
echo "::set-output name=clusters_list::$clusters_list"

echo "\n============Backup Snapshots List==============="
atlas backups snapshots list ecam

echo "\n============Backup Snapshots Creation==============="
atlas backups snapshots create ecam --desc "snapshot created by github workflow"