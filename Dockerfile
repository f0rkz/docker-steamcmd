FROM ubuntu:20.04
LABEL maintainer="nick@nickthegray.com"

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update -yq && \
    apt install -y --no-install-recommends \
        ca-certificates \
        lib32gcc1 \
        tar

ADD --chown=root:root https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz /tmp
RUN mkdir /opt/steamcmd
RUN tar zxfv /tmp/steamcmd_linux.tar.gz -C /opt/steamcmd && rm /tmp/steamcmd_linux.tar.gz
ENV PATH="${PATH}:/opt/steamcmd"

RUN steamcmd.sh +quit

VOLUME [ "/data" ]
