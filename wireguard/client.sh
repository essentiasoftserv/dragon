#!/bin/bash

INTERFACE="wg0"

# Generate peer keys
PRIVATE_KEY=$(wg genkey)
PUBLIC_KEY=$(echo ${PRIVATE_KEY} | wg pubkey)
SERVER_PUB_KEY=$(sudo wg | grep public | awk '{print $3}')
#!/bin/bash

# Define an associative array to keep track of generated numbers
declare -A generated_numbers

while true; do

    random_number=$((RANDOM % 254 + 2))

    # Check if the number is unique
    if [[ -z ${generated_numbers[$random_number]} ]]; then
        generated_numbers[$random_number]=1
        break
    fi
done

# Add peer
wg set wg0 peer ${PUBLIC_KEY} allowed-ips 10.0.0.${random_number}/32


echo "Added peer ${PEER_ADDRESS} with public key ${PUBLIC_KEY}"
cat << END_OF_CONFIG | qrencode -t ansiutf8 
[Interface]
Address = 10.0.0.${random_number}/8
PrivateKey = ${PRIVATE_KEY}
DNS = 8.8.8.8
[Peer]
PublicKey = ${SERVER_PUB_KEY}
AllowedIPs = 0.0.0.0/0
Endpoint = 192.168.29.67:51820 
PersistentKeepalive = 25
END_OF_CONFIG

cat << END_OF_CONFIG | tee client.conf > /dev/null
[Interface]
Address = 10.0.0.${random_number}/8
PrivateKey = ${PRIVATE_KEY}
DNS = 8.8.8.8
[Peer]
PublicKey = ${SERVER_PUB_KEY}
AllowedIPs = 0.0.0.0/0
Endpoint = 192.168.29.67:51820 
PersistentKeepalive = 25
END_OF_CONFIG