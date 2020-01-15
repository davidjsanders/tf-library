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
	docker run \
		--rm -it \
		--volume $(WORKDIR):/data \
		--volume $(WORKDIR)/targets:/secrets \
		--volume $(HOME)/.ssh/:/ssh/ \
		$(IMAGE_NAME) \
			taint $(EXTRA_ARGS); \
	echo ; \
	echo "Started taint at  : $$start"; \
	echo "Finished taint at : `date`"; \
	echo

init:
	@start="`date`"; \
	docker run \
		--rm -it \
		--volume $(WORKDIR):/data \
		--volume $(WORKDIR)/targets:/secrets \
		--volume $(HOME)/.ssh/:/ssh/ \
		$(IMAGE_NAME) \
			init -backend-config=/secrets/beconf.tfvars ; \
	echo ; \
	echo "Started init at  : $$start"; \
	echo "Finished init at : `date`"; \
	echo

plan:
	@start="`date`"; \
	docker run \
	--rm -it \
	--volume $(WORKDIR):/data \
	--volume $(WORKDIR)/targets:/secrets \
	--volume $(HOME)/.ssh/:/ssh/ \
	$(IMAGE_NAME) \
		plan \
		-input=false \
		-out=/secrets/$(ENVIRONMENT)-run \
		-var-file=/secrets/$(ENVIRONMENT).tfvars \
		-var-file=/secrets/credentials.secret\
		${EXTRA_ARGS}; \
	echo ; \
	echo "Started plan at  : $$start"; \
	echo "Finished plan at : `date`"; \
	echo

apply:
	@start="`date`"; \
	docker run \
	--rm -it \
	--volume $(WORKDIR):/data \
	--volume $(WORKDIR)/targets:/secrets \
	--volume $(HOME)/.ssh/:/ssh/ \
	$(IMAGE_NAME) \
		apply \
		-input=false \
		/secrets/$(ENVIRONMENT)-run; \
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
	docker run \
	--rm -it \
	--volume $(WORKDIR):/data \
	--volume $(WORKDIR)/targets:/secrets \
	--volume $(HOME)/.ssh/:/ssh/ \
	$(IMAGE_NAME) \
		destroy \
		-force \
		-input=false \
		-var-file=/secrets/$(ENVIRONMENT).tfvars \
		-var-file=/secrets/credentials.secret; \
	echo ; \
	echo "Started destroy at  : $$start"; \
	echo "Finished destroy at : `date`"; \
	echo
