# Container image that runs your code
FROM ubuntu

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY mongo_backup.sh /mongo_backup.sh

RUN apt-get update -y \
&& apt-get install -y gnupg wget \
&& wget -qO - https://pgp.mongodb.com/server-5.0.asc | apt-key add - \
&& echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/5.0 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-5.0.list \
&& apt-get install -y mongodb-atlas-cli \
&& chmod +x mongo_backup.sh

# Code file to execute when the docker container starts up (`mongo_backup.sh`)
ENTRYPOINT ["/mongo_backup.sh"]