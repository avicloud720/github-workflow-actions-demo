# Container image that runs your code
FROM alpine:3.10

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY mongo_backup.sh /mongo_backup.sh

# Code file to execute when the docker container starts up (`mongo_backup.sh`)
ENTRYPOINT ["/mongo_backup.sh"]

CMD [ "chmod +x entrypoint.sh" ]