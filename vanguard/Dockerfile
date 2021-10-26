FROM ubuntu:focal

ARG NETWORK=l15-prod
ARG CDN=https://storage.googleapis.com/l15-cdn/networks/${NETWORK}
ARG REPO=vanguard-consensus-engine
ARG CLIENT=vanguard
ARG TAG=v0.1.0-rc.1
ARG PLATFORM=Linux
ARG TARGET=/opt/lukso/networks/$NETWORK/config

RUN apt update \
  && apt install -y wget \
  && mkdir -p /opt/lukso/networks/$NETWORK/config/ \
  && wget -O /opt/lukso/networks/$NETWORK/config/vanguard-genesis.ssz $CDN/vanguard-genesis.ssz?ignoreCache=1 \
  && wget -O /opt/lukso/networks/$NETWORK/config/vanguard-config.yaml $CDN/vanguard-config.yaml?ignoreCache=1 \
  && wget -O /usr/local/bin/app https://github.com/lukso-network/$REPO/releases/download/$TAG/$CLIENT-$PLATFORM-$(uname -m) \
  && chmod +x /usr/local/bin/app

ADD entrypoint.sh /
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
