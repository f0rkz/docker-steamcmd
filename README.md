# Docker Steamcmd

This is a base docker image for gameservers using the steamcmd service provided by Valve.

## Usage

Start your docker project with:

```
FROM ghcr.io/f0rkz/docker-steamcmd:latest
```

Utilize steamcmd in your entrypoint or dockerfiles:

```
/opt/steamcmd/steamcmd.sh +login anonymous +force_install_dir /data/avorion +app_update 565060 validate +quit
```
