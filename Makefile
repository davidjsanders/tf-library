ifndef WORKDIR
  override WORKDIR := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))
endif

ifndef IMAGE_NAME
  override IMAGE_NAME := "dsanderscan/docker-terraform:19.10.33"
endif

ifndef ENVIRONMENT
  override ENVIRONMENT=dev
endif

.PHONY: init taint plan apply destroy graph

taint:
	@start="`date`"; \
	terraform taint $(EXTRA_ARGS); \
	echo ; \
	echo "Started taint at  : $$start"; \
	echo "Finished taint at : `date`"; \
	echo

init:
	@start="`date`"; \
	terraform init -backend-config=targets/beconf.tfvars ; \
	echo ; \
	echo "Started init at  : $$start"; \
	echo "Finished init at : `date`"; \
	echo

plan:
	@start="`date`"; \
	terraform plan \
		-input=false \
		-out=targets/$(ENVIRONMENT)-run \
		-var-file=targets/$(ENVIRONMENT).tfvars \
		-var-file=targets/credentials.secret\
		${EXTRA_ARGS}; \
	echo ; \
	echo "Started plan at  : $$start"; \
	echo "Finished plan at : `date`"; \
	echo

apply:
	@start="`date`"; \
	terraform apply \
		-input=false \
		targets/$(ENVIRONMENT)-run; \
	echo ; \
	echo "Started apply at  : $$start"; \
	echo "Finished apply at : `date`"; \
	echo

graph:
	@start="`date`"; \
	docker run \
	--rm -it \
	--volume $(WORKDIR):/data \
	--volume $(WORKDIR)/targets:/secrets \
	--volume $(HOME)/.ssh/:/ssh/ \
	$(IMAGE_NAME) \
		graph \
		-type=plan \
		/secrets/$(ENVIRONMENT)-run; \
	echo ; \
	echo "Started graph at  : $$start"; \
	echo "Finished graph at : `date`"; \
	echo

destroy:
	@start="`date`"; \
	terraform destroy \
		-force \
		-input=false \
		-var-file=targets/$(ENVIRONMENT).tfvars \
		-var-file=targets/credentials.secret; \
	echo ; \
	echo "Started destroy at  : $$start"; \
	echo "Finished destroy at : `date`"; \
	echo
