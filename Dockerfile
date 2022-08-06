FROM ubuntu:20.04
LABEL maintainer="nick@nickthegray.com"

ENV SERVER_ADMIN 0
ENV GALAXY_NAME galaxy

RUN apt update -yq && \
    apt install -y --no-install-recommends \
        ca-certificates \
        wget \
        lib32gcc1 \
        tar

RUN wget "https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz" -O /tmp/steamcmd_linux.tar.gz
RUN mkdir -p /opt/steamcmd && tar zxfv /tmp/steamcmd_linux.tar.gz -C /opt/steamcmd
RUN rm -f /tmp/steamcmd_linux.tar.gz

RUN /opt/steamcmd/steamcmd.sh +quit
