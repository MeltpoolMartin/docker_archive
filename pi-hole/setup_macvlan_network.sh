#!/bin/bash

# Create dedicated macvlan interface that a pi-hole container can use
# Parameter:
# --gateway: IP address of gateway used by macvlan (pi-hole)
# --subnet: subnet mask of macvlan
# --ip-range: limit available addresses in the subnet only to one (/32)
# -o parent: name of network adapter - ip route | grep default

docker network create \
--driver=macvlan \
--gateway=192.168.1.10 \
--subnet=192.168.1.0/24 \
--ip-range=192.168.1.20/32 \
-o parent=ovs_eth0 \
VLAN1_pi-hole