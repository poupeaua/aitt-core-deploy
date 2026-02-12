.PHONY: check-env-vars	

define check_var
	@if [ -z "$(1)" ]; then \
		echo "❌ ERROR: $(2) is not set"; exit 1; \
	fi
endef

check-env-vars:
	$(call check_var,$(ANSIBLE_PRIVATE_KEY_FILE),ANSIBLE_PRIVATE_KEY_FILE)
	$(call check_var,$(AWS_ACCOUNT_ID),AWS_ACCOUNT_ID)
	$(call check_var,$(AWS_REGION),AWS_REGION)
	$(call check_var,$(IMAGE_NAME),IMAGE_NAME)
	$(call check_var,$(IMAGE_TAG),IMAGE_TAG)
	$(call check_var,$(PORT_INPUT),PORT_INPUT)
	$(call check_var,$(DOCKER_NETWORK),DOCKER_NETWORK)
	$(call check_var,$(HALFCIRCLE_SERVICE_URL),HALFCIRCLE_SERVICE_URL)
	$(call check_var,$(SLUG),SLUG)
	@echo "✅ All required environment variables are set."