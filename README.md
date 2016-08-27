# Homegear Docker Image

[Homegear]([https://www.homegear.eu]) is a free and open source program to interface your HomeMatic BidCoS, HomeMatic Wired, MAX!, INSTEON, KNX, Sonos, Philips hue and Beckhoff devices with your home automation software (like IP-Symcon, openHAB, etc.) or your own control scripts.

This Docker Image is based on Debian 8 (Jessie) and runs Homegear 0.6.7.

It has the following modules pre-installed:
* homegear-homematicbidcos 
* homegear-homematicwired 
* homegear-insteon 
* homegear-max 
* homegear-philipshue 
* homegear-sonos 
* homegear-kodi 
* homegear-ipcam 
* homegear-beckhoff 
* homegear-knx

To run it as a daemon in background, use:

```
docker run \
        --name homegear \
        -v /etc/localtime:/etc/localtime:ro \
        -v /etc/timezone:/etc/timezone:ro \
        -v /docker/storage/homegear/physicalinterfaces.conf:/etc/homegear/physicalinterfaces.conf \
        -v /docker/storage/homegear/sql.db:/var/lib/homegear/db.sql \
        -p 2001:2001 -p 2002:2002 -p 2003:2003 \
        -d \
        --restart=always \
        virtualzone/homegear
``` 