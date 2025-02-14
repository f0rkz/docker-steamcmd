FROM debian:12-slim
LABEL maintainer="nick@nickthegray.com"

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update -yq && \
    apt install -y --no-install-recommends \
        software-properties-common && \
    apt-add-repository non-free && \
    dpkg --add-architecture i386

RUN apt update -yq && \
    apt install -y --no-install-recommends \
        ca-certificates \
        lib32gcc-s1 \
        tar

ADD --chown=root:root https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz /tmp
RUN mkdir /opt/steamcmd
RUN tar zxfv /tmp/steamcmd_linux.tar.gz -C /opt/steamcmd && rm /tmp/steamcmd_linux.tar.gz
ENV PATH="${PATH}:/opt/steamcmd"

RUN steamcmd.sh +quit

VOLUME [ "/data" ]
