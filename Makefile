include .env
include .scripts/ensure_env_vars.mk

nginx: check-env-vars
	ansible-playbook playbooks/nginx.yaml \
		-e "ansible_ssh_private_key_file=${ANSIBLE_PRIVATE_KEY_FILE}" \
		-e "AWS_ACCOUNT_ID=${AWS_ACCOUNT_ID}" \
		-e "AWS_REGION=${AWS_REGION}" \
		-e "PORT_INPUT=${PORT_INPUT}"

deploy: check-env-vars
	ansible-playbook playbooks/deploy.yaml \
		-e "ansible_ssh_private_key_file=${ANSIBLE_PRIVATE_KEY_FILE}" \
		-e "AWS_ACCOUNT_ID=${AWS_ACCOUNT_ID}" \
		-e "AWS_REGION=${AWS_REGION}" \
		-e "IMAGE_NAME=${IMAGE_NAME}" \
		-e "IMAGE_TAG=${IMAGE_TAG}" \
		-e "SERVICE_NAME=${SERVICE_NAME}" \
		-e "PORT_INPUT=${PORT_INPUT}" \
		-e "DOCKER_NETWORK=${DOCKER_NETWORK}"
