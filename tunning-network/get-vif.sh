#!/bin/sh

for INSTANCEID in $(xe vm-list | awk '/name-label/' | grep -v "Control domain" | awk '{print $4}')
  do
    VMUUID=$(xe vm-list name-label=${INSTANCEID} | awk '/uuid/ {print $5}')
      for VIFUUID in $(xe vif-list vm-uuid=$VMUUID | awk '/uuid/ {print $5}' | sed '/^$/d')
        do
          echo $VIFUUID
          xe vif-param-list uuid=$VIFUUID | grep "other-config"
      done
done

