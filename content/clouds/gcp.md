+++
title = "GCP"
description = "Google's Cloud"
+++


## Install the CLI

Google ships a cli suite `gcloud` and `gsutil`.

[See these docs](https://cloud.google.com/sdk/docs/quickstart-macos)


## Inventory Commands

List vms

```
gcloud compute instances list
```

List managed DBs

```
gcloud sql instances list
```

## Launch Instances

gcloud compute instances create NAMES... \
  --image="qa-1583525013" \
  --zone="us-east4-c" \
  --boot-disk-size="10GB" \
  --labels"KEY1=VAL1,KEY2=VAL2" \
  --machine-type="e2-medium" \
  --metadata="startup-script=\"bash /opt/provision.sh\"" \
  --service-account="foo"
```

List machine types

```
gcloud compute machine-types list
```

## Service Accounts

These are accounts we create that are roughly analagous to roles in AWS.

```
gcloud iam service-accounts list
```

Get secrets from authenticated machines:
https://cloud.google.com/sdk/gcloud/reference/beta/secrets/


## OS Login

OS Login is a feature of Google Cloud that lets users ssh into instances without
manually distributing ssh public keys. 

Permissions should be lower than the following, but I haven't tried it:

```
Editor
Compute OS Login Admin
Compute OS Login
```

## Generate an ssh key

```
ssh-keygen
```

A passphrase isn't required.

## Add your SSH key to instances

This command lest you log into existing instances.

```
gcloud compute os-login ssh-keys add \
    --key-file key-file-path \
    --ttl 0d
```

[See these docs.](https://cloud.google.com/compute/docs/instances/managing-instance-access#add_oslogin_keys)



