#!/bin/sh

for PIFUUID in `xe pif-list | awk '/uuid/ {print $5}' | sed '/^$/d'`
  do
    echo $PIFUUID;
    xe pif-param-list uuid=$PIFUUID | grep "other-config"
done
