# Belitradas test-infra

Almost eveything in this repo is from https://github.com/kubernetes/test-infra :)

# Test a job

```
mkpj -config-path prow/config.yaml -job-config-path path/to/job.yaml -job job-name > job.yaml
```

After this apply `job.yaml`in __default namespace_.