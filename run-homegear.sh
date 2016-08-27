#!/bin/sh

CONFIGPATH=/etc/homegear
DAEMON=/usr/bin/homegear
PIDPATH=/var/run/homegear
PIDFILE=$PIDPATH/homegear.pid
DBPATH=/var/lib/homegear
STATICPATH=/usr/share/homegear
LOGPATH=/var/log/homegear

RUNASUSER=homegear
RUNASGROUP=homegear

if test ! -d $PIDPATH; then
    mkdir -p $PIDPATH
fi
chown -R $RUNASUSER:$RUNASGROUP $PIDPATH
chmod -R 750 $PIDPATH

if test ! -d $DBPATH; then
    mkdir -p $DBPATH
fi
if test ! -f $DBPATH/db.sql; then
    touch $DBPATH/db.sql
fi
chown -R $RUNASUSER:$RUNASGROUP $DBPATH
chmod 750 $DBPATH
chmod 640 $DBPATH/db.sql
chmod 550 $DBPATH/scripts
chown -R $RUNASUSER:$RUNASGROUP $STATICPATH
chmod 550 $STATICPATH
chmod 550 $STATICPATH/firmware
chmod 440 $STATICPATH/firmware/*
chmod 550 $STATICPATH/firmware/GetFirmwareUpdates*.sh
chmod -R 550 $DBPATH/modules

if test ! -d $LOGPATH; then
    mkdir -p $LOGPATH
fi
chown -R $RUNASUSER:$RUNASGROUP $LOGPATH
chmod -R 750 $LOGPATH

$DAEMON -u $RUNASUSER -g $RUNASGROUP
