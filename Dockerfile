FROM ubuntu:14.04
MAINTAINER Olivier Lalonde <olalonde@gmail.com>

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 8842ce5e && \
    echo "deb http://ppa.launchpad.net/bitcoin/bitcoin/ubuntu trusty main" > /etc/apt/sources.list.d/bitcoin.list

RUN apt-get update && \
    apt-get install -y bitcoind aria2 && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE 8332 8333 18332 18333

CMD ["/usr/bin/bitcoind", "-datadir=/data", "--printtoconsole", "-server=0", "-testnet"]