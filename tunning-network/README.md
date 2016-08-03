# Tunning Network (Tested in XenServer 6.2 and 6.5)

Some network interfaces don't work properly with XenServer and you have a slow network communication. Based in my short experience with XenServer, the problem is a incompatibility XenServer and network interface flags like *generic segmentation offload*. So, this "tunning scripts" just disable all flags of all physical and virtual networks.

### Before tunning
1. Make sure you have a full backup of your VMs or data.
2. Execute the scripts *get-pif.sh* and *get-vif.sh* and save the default parameters with you need to revert.

### Scripts
1. get-pif.sh: list current flags of all physical interfaces
2. get-vif.sh: list current flags of all virtual interfaces of all VMs
3. tun-pif.sh: turned off all flags of all physical interfaces
4. tun-vif.sh: turned off all flags of all virtual interfaces of all VMs

### Tunning
1. Follow "Before tunning" instructions above
2. Execute *tun-pif.sh*
3. Execute *tun-vif.sh*
4. Reboot Server

### Problems
You can set manually some flags on or off and make a performance test.

### Recover flags configuration
You need to do it manually. Probably you saved the original configuration at item 2 in the "Before tunning" instructions above, use it.

**This scripts have no guarantee and depends on your hardware. You are by your own!**
