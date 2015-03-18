# docker-bitcoind

## Install on CoreOS

1. Create new 70 GB SSD EBS volume on AWS (volume ID).

2. Create ELB for bitcoind (elb name: bitcoind-testnet).

2. Get root credentials in IAM (aws key and secret).

```bash
ssh core@coreosdomain.com
core@ip-10-21-2-217 ~ $ etcdctl set /aws_key yourawskey
core@ip-10-21-2-217 ~ $ etcdctl set /aws_secret yourawssecret
core@ip-10-21-2-217 ~ $ etcdctl set /bitcoind_volume_id yourvolumeid
```


