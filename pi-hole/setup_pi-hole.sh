#!/bin/bash

# Run pi-hole container with macvlan configuration
# 1. exectue setup_macvlan_network.sh to create a dedicated network
#   --network: name of the macvlan network
#   --mac-address: mac address of the macvlan
# 2. execute setup_pi-hole.sh to create a pi-hole container with the latest image

docker run --detach \
           --name pi-hole \
           --restart unless-stopped \
           --volume /etc/localtime:/etc/localtime:ro \
           --volume /volume1/docker/pi-hole/etc/hosts:/etc/hosts \
           --volume /volume1/docker/pi-hole/config:/etc/pihole \
           --volume /volume1/docker/pi-hole/dnsmasq:/etc/dnsmasq.d \
           --cap-add NET_ADMIN \
           --dns=1.0.0.1 \
           --dns=1.1.1.1 \
           --env "DNS1=1.1.1.1" \
           --env "DNS2=1.0.0.1" \
           --env "ServerIP=192.168.1.20" \
           --env "DNSMASQ_LISTENING=local" \
           --env "TZ=Europe/Berlin" \
           --network VLAN1_pi-hole \
           --ip "192.168.1.20" \
           --mac-address "02:42:c0:a8:01:d7" \
           pihole/pihole:latest