#!/usr/bin/env bash

K8S_TEST_INFRA_PATH="${K8S_TEST_INFRA_PATH:-${HOME}/go/src/k8s.io/test-infra/hack}"
MY_PATH="${MY_PATH:-$HOME/go/src/github.com/belitradas/test-infra}"

cd $K8S_TEST_INFRA_PATH

bazel run //prow/cmd/checkconfig -- --plugin-config=$MY_PATH/prow/plugins.yaml --config-path=$MY_PATH/prow/config.yaml --job-config-path=$MY_PATH/config/jobs
