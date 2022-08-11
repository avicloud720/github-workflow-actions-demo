# Container image that runs your code
FROM alpine:3.10

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY mongo_backup.sh /mongo_backup.sh

RUN apk update && apk add sudo \
&& sudo yum install -y mongodb-atlas-cli
&& chmod +x mongo_backup.sh

# Code file to execute when the docker container starts up (`mongo_backup.sh`)
ENTRYPOINT ["/mongo_backup.sh"]