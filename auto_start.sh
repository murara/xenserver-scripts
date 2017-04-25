#!/bin/sh

# First you need to setup the host:
#  $ xe pool-list
#  $ xe pool-param-set uuid=XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX other-config:auto_poweron=true

for VMUUID in $(xe vm-list | grep uuid | awk '{print $5}')
  do
  xe vm-param-set uuid=$VMUUID other-config:auto_poweron=true
done

