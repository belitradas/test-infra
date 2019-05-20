#!/bin/bash

BUCKET_NAME=belitradas-prow-artifacts

gcloud iam service-accounts create prow-gcs-publisher # step 1
identifier="$(  gcloud iam service-accounts list --filter 'name:prow-gcs-publisher' --format 'value(email)' )"
gsutil mb -l europe-west2 gs://${BUCKET_NAME}  # step 2
gsutil iam ch allUsers:objectViewer gs://${BUCKET_NAME} # step 3
gsutil iam ch "serviceAccount:${identifier}:objectAdmin" gs://${BUCKET_NAME} # step 4
gcloud iam service-accounts keys create --iam-account "${identifier}" service-account.json # step 5
kubectl create secret generic gcs-credentials --from-file=service-account.json --namespace default # step 6