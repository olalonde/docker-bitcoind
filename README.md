# docker-bitcoind

## Install on CoreOS

1. Create new 70 GB SSD EBS volume on AWS (volume ID).  Attach EBS to a
   temporary Linux VM and format disk with mkfs:

   `mkfs -t ext4 /dev/xvdg`

2. Create ELB for bitcoind (elb name: bitcoind-testnet). Needs to
   forward TCP port 18333. Security group: allow 18333 from 0.0.0.0/0

3. Get root credentials in IAM (aws key and secret).

```bash
ssh core@coreosdomain.com -i ~/.ssh/someidfile
core@ip-10-21-2-217 ~ $ etcdctl set /aws_key yourawskey
core@ip-10-21-2-217 ~ $ etcdctl set /aws_secret yourawssecret
core@ip-10-21-2-217 ~ $ etcdctl set /bitcoind_volume_id yourvolumeid
```

4. Launch bitcoind on the cluster

```bash
ssh-add ~/.ssh/coreskey 2> /dev/null
export FLEETCTL_TUNNEL=yourcoreos.com:22
export FLEETCTL_SSH_TIMEOUT=100
export FLEETCTL_REQUEST_TIMEOUT=30
fleetctl start bitcoind.service
fleetctl journal -lines=30 -follow bitcoind.service
```
