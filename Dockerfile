FROM ubuntu:20.04
LABEL maintainer="nick@nickthegray.com"

ENV DEBIAN_FRONTEND=noninteractive
RUN useradd -m steam

RUN apt update -yq && \
    apt install -y --no-install-recommends \
        ca-certificates \
        lib32gcc1 \
        tar
RUN mkdir -p /data
RUN chown -R steam:steam /data

USER steam
ADD --chown=steam:steam https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz /home/steam/
RUN mkdir /home/steam/steamcmd
RUN tar zxfv /home/steam/steamcmd_linux.tar.gz -C /home/steam/steamcmd && rm /home/steam/steamcmd_linux.tar.gz
ENV PATH="${PATH}:/home/steam/steamcmd"

RUN steamcmd.sh +quit

VOLUME [ "/data" ]
