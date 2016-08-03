#!/bin/sh

for PIFUUID in $(xe pif-list | awk '/uuid/ {print $5}' | sed '/^$/d')
  do
    xe pif-param-set uuid=$PIFUUID other-config:ethtool-gso="off";
    xe pif-param-set uuid=$PIFUUID other-config:ethtool-ufo="off";
    xe pif-param-set uuid=$PIFUUID other-config:ethtool-tso="off";
    xe pif-param-set uuid=$PIFUUID other-config:ethtool-sg="off";
    xe pif-param-set uuid=$PIFUUID other-config:ethtool-tx="off";
    xe pif-param-set uuid=$PIFUUID other-config:ethtool-rx="off";
done
