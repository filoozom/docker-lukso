FROM ubuntu:focal

ARG REPO=vanguard-consensus-engine
ARG CLIENT=vanguard
ARG TAG=v0.1.0-rc.1
ARG PLATFORM=Linux

RUN apt update \
  && apt install -y wget \
  && wget -O /usr/local/bin/app https://github.com/lukso-network/$REPO/releases/download/$TAG/$CLIENT-$PLATFORM-$(uname -m) \
  && chmod +x /usr/local/bin/app

ADD entrypoint.sh /
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
