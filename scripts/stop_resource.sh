#!/bin/bash

# Stop a cluster resource

if [ $# -eq 0 ]; then
    echo "Usage: $0 <resource_name>"
    exit 1
fi

RESOURCE_NAME=$1

pcs resource disable $RESOURCE_NAME

echo "Resource $RESOURCE_NAME has been stopped."