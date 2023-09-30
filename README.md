# OpenShift Workload Identity Federation

## Usage

Create an environment file `.env`, where `GOOGLE_CREDENTIALS` points to GCP service
account credentials for the `srox-temp-dev-test` project.

```
GOOGLE_CREDENTIALS=./secrets/gcpServiceAccount.json
PULL_SECRET_PATH=./secrets/pullSecret.json
SSH_KEY="ssh-ed25519 XXX XXX"
RELEASE_IMAGE=quay.io/openshift-release-dev/ocp-release:4.13.13-x86_64
NAME=stehessel-wif
PROJECT=srox-temp-dev-test
REGION=europe-west3
BASE_DOMAIN=openshift.infra.rox.systems
```

Install OpenShift and Central with WIF enabled:

```
npm install -g @devcontainers/cli
devcontainer up --id-label="name=wif" --workspace-folder=.
devcontainer exec --id-label="name=wif" --workspace-folder=. devenv shell
task
```

To uninstall OpenShift and remove GCP resources:

```
task uninstall
```

To test the external Google Cloud Storage backup with WIF credentials:

* Create a bucket in Google Cloud Storage in the GCP project configured in `.env`.
* Configure a Central backup to the bucket and activate workload identities.
* Trigger the backup.
