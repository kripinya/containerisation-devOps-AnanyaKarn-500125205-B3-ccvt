#!/bin/bash

NETWORK_NAME="app_network"

echo "Creating Docker Network: $NETWORK_NAME"

# Check if network exists
if docker network ls | grep -w $NETWORK_NAME > /dev/null; then
  echo "Network $NETWORK_NAME already exists. Removing it..."
  docker network rm $NETWORK_NAME
fi

# Creating an ipvlan network
# Note: For Docker Desktop on Mac, `eth0` is the primary interface of the underlying Linux VM.
echo "Running docker network create..."
docker network create -d ipvlan \
  --subnet=192.168.1.0/24 \
  --gateway=192.168.1.1 \
  -o parent=eth0 \
  $NETWORK_NAME

echo "Network created successfully!"
docker network inspect $NETWORK_NAME
