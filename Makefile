
validate-config:
	./prow/scripts/validate-config.sh

deploy-prow-dry-run:
	./prow/scripts/apply-manifests.sh -d

deploy-prow:
	./prow/scripts/apply-manifests.sh
