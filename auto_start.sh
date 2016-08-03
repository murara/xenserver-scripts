#!/bin/sh

for VMUUID in $(xe vm-list | grep uuid | awk '{print $5}')
  do
  xe vm-param-set uuid=$VMUUID other-config:auto_poweron=true
done

