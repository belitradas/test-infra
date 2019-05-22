
KUBECTL_VERSION ?= 1.14.2

kubectl-build:
	docker build ./dockerfiles/kubectl --build-arg KUBECTL_VERSION=$(KUBECTL_VERSION) -t belitre/kubectl:$(KUBECTL_VERSION)

kubectl-push:
	docker push belitre/kubectl:$(KUBECTL_VERSION)

validate-config:
	./prow/scripts/validate-config.sh

deploy-prow-dry-run:
	./prow/scripts/apply-manifests.sh -d

deploy-prow:
	./prow/scripts/apply-manifests.sh