# aitt-core-deploy

Deployment for the aitt ressource.

Basically, another repository manage the deployment of the application container.

This repository is used to deploy the container on the EC2 instance and ensure
it is up and running via Ansible (and systemd behind the scene on the remote server).

# Pre-requisites

## Ansible

You need `uv` installed. Then run:

```sh
uv sync
```

## Environment variables

In order to make this work you need some special environment variables.
You can put them in a .env file and load it with the `source .env` command.

```sh
ANSIBLE_PRIVATE_KEY_FILE=~/.ssh/keys/name-of-your-private-key.pem
AWS_ACCOUNT_ID=************
AWS_REGION=***
IMAGE_NAME=aitt/core
IMAGE_TAG=0.3.0
SERVICE_NAME=aitt-core
PORT_INPUT=8001
DOCKER_NETWORK=aitt-network
HALFCIRCLE_SERVICE_URL=http://aitt-symbol-clf:8000
SLUG=aitt
```



