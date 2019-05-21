#!/usr/bin/env bash

K8S_TEST_INFRA_PATH="${K8S_TEST_INFRA_PATH:-${HOME}/go/src/k8s.io/test-infra/hack/}"

cd $K8S_TEST_INFRA_PATH

bazel run //prow/cmd/checkconfig -- --plugin-config=$HOME/go/src/github.com/belitradas/test-infra/prow/plugins.yaml --config-path=$HOME/go/src/github.com/belitradas/test-infra/prow/config.yaml
