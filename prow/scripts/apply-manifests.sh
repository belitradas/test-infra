#!/usr/bin/env bash

set -e

DRYRUN="false"

while [ "$1" != "" ]; do
    case $1 in
    -d|--dry-run)
        DRYRUN="true"
        ;;
    -?*)
        echo "Unknown option (ignored): $1"
        ;;
    *)
        break
    esac
    shift
done

set -euo pipefail

DRY_RUN_OPTS=" "

if [ "${DRYRUN}" = "true" ]; then
    DRY_RUN_OPTS="--dry-run"
fi

BELITRADAS_TEST_INFRA_PATH="${BELITRADAS_TEST_INFRA_PATH:-$HOME/go/src/github.com/belitradas/test-infra}"

kubectl apply -f ${BELITRADAS_TEST_INFRA_PATH}/prow/manifests/resources/ -R ${DRY_RUN_OPTS}

