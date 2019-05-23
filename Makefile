
KUBECTL_VERSION ?= 1.14.2


GOX_VERSION ?= 1.0.0
GO_BUILDER_VERSION ?= 1.12.5

kubectl-build:
	docker build ./dockerfiles/kubectl --build-arg KUBECTL_VERSION=$(KUBECTL_VERSION) -t belitre/kubectl:$(KUBECTL_VERSION)

kubectl-push:
	docker push belitre/kubectl:$(KUBECTL_VERSION)

gobuilder-build:
	docker build ./dockerfiles/gobuilder --build-arg GOX_VERSION=$(GOX_VERSION) -t belitre/gobuilder:$(GO_BUILDER_VERSION)

gobuilder-push:
	docker push belitre/gobuilder:$(GO_BUILDER_VERSION)

validate-config:
	./prow/scripts/validate-config.sh

deploy-prow-dry-run:
	./prow/scripts/apply-manifests.sh -d

deploy-prow:
	./prow/scripts/apply-manifests.sh