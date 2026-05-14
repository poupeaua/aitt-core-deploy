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

You can check the content of the `.env.example` file for more information.

# How-to

1. You first have to ensure you have a private ssh key locally and the public key
on the EC2 instance. You can create the key pair using the AWS console on the 
interface in the Network and Security section EC2 section. Make sure you can
already connect to the EC2 instance using:
`ssh -i ~/.ssh/keys/name-of-your-private-key.pem ec2-user@public_ip_address`

Ideally you have configured your `~/.ssh/config` file with the following content:

```
Host aitt-instance-1
  HostName ec2-user@public_ip_address
  IdentityFile ~/.ssh/keys/name-of-you-private-key.pem
  User ec2-user
```

So you can more easily connect to the EC2 instance using the command 
`ssh aitt-instance-1`

Set correctly your `ANSIBLE_PRIVATE_KEY_FILE` environment variable.

The EC2 will be automatically found via Ansible thanks to tags defined in the
instance after creation by the Terraform repository:
https://github.com/poupeaua/aitt-infra

2. We use an optional Domain Name here to make it easier to access the service.
You need to setup the domain to point to the public IP address of the EC2 instance.

For example, in SquareSpace (the new Google Domain), you can create a `A` record
with a name `app` where the value is the public IP address of the EC2 instance.

This needs to be setup otherwise the nginx setup will fail.

3. First run `make nginx` to configure the Nginx reverse proxy.

4. Then run `make deploy` to deploy the container on the EC2 instance.

# Test post-deployment

