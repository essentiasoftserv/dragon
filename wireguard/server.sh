#!/bin/bash

INTERFACE="wg0"

# Generate peer keys
PRIVATE_KEY=$(wg genkey)
PUBLIC_KEY=$(echo ${PRIVATE_KEY} | wg pubkey)

cat << END_OF_CONFIG | tee wg0.conf > /dev/null
[Interface]
Address = 10.0.0.1/32
ListenPort = 51820
SaveConfig = true
PostUp = iptables -A FORWARD -i wg0 -j ACCEPT; iptables -t nat -A POSTROUTING -o enp0s1 -j MASQUERADE;
PostDown = iptables -D FORWARD -i wg0 -j ACCEPT; iptables -t nat -D POSTROUTING -o enp0s1 -j MASQUERADE;
PrivateKey = ${PRIVATE_KEY}
END_OF_CONFIG