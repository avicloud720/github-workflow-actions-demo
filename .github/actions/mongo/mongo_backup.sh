#!/bin/sh -l

echo "Connecting to MongoDB Atlas......"
atlas --version

echo "\n\n============Configuration Setup===============\n\n"
atlas config set public_api_key ${{ secrets.MONGO_ATLAS_PUB_API_KEY }}
atlas config set private_api_key ${{ secrets.MONGO_ATLAS_PRIV_API_KEY }}
atlas config set project_id ${{ secrets.MONGO_ATLAS_PROJECT_ID }}
atlas config set org_id ${{ secrets.MONGO_ATLAS_ORG_ID }}

echo "\n\n============Cluster List===============\n\n"
echo "This is $1"
clusters_list=`atlas clusters list`
echo "::set-output name=clusters_list::$clusters_list"

# echo -e "\n\n============Backup Snapshots List===============\n\n"
# atlas backups snapshots list ecam

# echo -e "\n\n============Backup Snapshots Creation===============\n\n"
# atlas backups snapshots create ecam --desc "snapshot created by github workflow"