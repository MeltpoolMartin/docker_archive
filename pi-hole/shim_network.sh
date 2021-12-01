#!/bin/bash

ip link add macvlan_shim link eth0 type macvlan mode bridge
ip addr add 192.168.1.21/32 dev macvlan_shim
ip link set macvlan_shim up
ip route add 192.168.1.20 dev macvlan_shim
