#!/bin/sh

for INSTANCEID in $(xe vm-list | awk '/name-label/' | grep -v "Control domain" | awk '{print $4}')
  do
    VMUUID=$(xe vm-list name-label=${INSTANCEID} | awk '/uuid/ {print $5}')
      for VIFUUID in $(xe vif-list vm-uuid=$VMUUID | awk '/uuid/ {print $5}' | sed '/^$/d')
        do
          xe vif-param-set uuid=$VIFUUID other-config:ethtool-gso="off"
          xe vif-param-set uuid=$VIFUUID other-config:ethtool-ufo="off"
          xe vif-param-set uuid=$VIFUUID other-config:ethtool-tso="off"
          xe vif-param-set uuid=$VIFUUID other-config:ethtool-sg="off"
          xe vif-param-set uuid=$VIFUUID other-config:ethtool-tx="off"
          xe vif-param-set uuid=$VIFUUID other-config:ethtool-rx="off"
      done
done

