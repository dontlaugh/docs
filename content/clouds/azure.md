+++
title = "Azure"
description = "Microsoft's cloud"
+++



## Inventory Scripts

Install `az` cli. Then login via browser.

```
az login
```

Count Azure virtual machines

```
az vm list | jq -r '.[].vmId' | wc -l
```

List virtual machines, their size (not including disk), and their tags

```
az vm list | jq -r '.[] | "\(.vmId)\t\(.hardwareProfile.vmSize)\t \(.name)"'

az vm list | jq -r '.[] | "\(.vmId)\t\(.hardwareProfile.vmSize)\t  \(.tags)"'
```

Some are deallocated. Expand VM details to get their power state. Warning:
this command is slow.

```
az vm list --show-details | jq -r '.[] | "\(.powerState)\t\(.hardwareProfile.vmSize)\t\(.name)"'
```

List snapshots

```
az snapshot list | jq -r '.[].name'
```

List disks

```
az disk list | jq -r '.[].name'
az disk list | jq -r '.[] | "\(.name)\t\(.diskSizeGb)\t\(.diskState)\t\(.tags)"'
```

