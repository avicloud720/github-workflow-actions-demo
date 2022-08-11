#!/bin/sh -l

echo "Connecting to MongoDB Atlas......"
wget -qO - https://pgp.mongodb.com/server-5.0.asc | sudo apt-key add -
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/5.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-5.0.list
sudo apt-get update
sudo apt-get install -y mongodb-atlas-cli
sudo apt-get install --only-upgrade mongodb-atlas-cli

# brew install mongodb-atlas
atlas --version

echo -e "\n\n============Configuration Setup===============\n\n"
atlas config set public_api_key gripbfjg
atlas config set private_api_key 5cc3328a-9ff1-4bbb-9e98-c5380172e1e7
atlas config set project_id 62f3427084a04c48f05f8a7e
atlas config set org_id 62f342087fa66d7a256e53b5

echo -e "\n\n============Cluster List===============\n\n"
echo "This is $1"
clusters_list=`atlas clusters list`
echo "::set-output name=clusters_list::$clusters_list"

# echo -e "\n\n============Backup Snapshots List===============\n\n"
# atlas backups snapshots list ecam

# echo -e "\n\n============Backup Snapshots Creation===============\n\n"
# atlas backups snapshots create ecam --desc "snapshot created by github workflow"