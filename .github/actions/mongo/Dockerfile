# Container image that runs your code
FROM ubuntu

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY mongo_backup.sh /mongo_backup.sh

RUN sudo apt-get install gnupg \
&& wget -qO - https://pgp.mongodb.com/server-5.0.asc | sudo apt-key add - \
&& echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/5.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-5.0.list \
&& sudo apt-get update \
&& sudo apt-get install -y mongodb-atlas-cli \
&& chmod +x mongo_backup.sh

# Code file to execute when the docker container starts up (`mongo_backup.sh`)
ENTRYPOINT ["/mongo_backup.sh"]