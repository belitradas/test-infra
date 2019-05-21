#!/usr/bin/env bash

cd $HOME/go/src/k8s.io/test-infra/hack/

bazel run //prow/cmd/checkconfig -- --plugin-config=$HOME/go/src/github.com/belitradas/test-infra/prow/plugins.yaml --config-path=$HOME/go/src/github.com/belitradas/test-infra/prow/config.yaml
