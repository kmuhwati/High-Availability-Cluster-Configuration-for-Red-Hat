#!/bin/bash

# Setup script for Red Hat High-Availability Cluster

# Check if running as root
if [ "$EUID" -ne 0 ]; then
  echo "Please run as root"
  exit 1
fi

# Install required packages
yum install -y pacemaker pcs corosync

# Enable and start pcsd service
systemctl enable pcsd
systemctl start pcsd

# Set hacluster password
echo "Setting hacluster password..."
echo "haclusterpassword" | passwd --stdin hacluster

# Configure firewall
firewall-cmd --permanent --add-service=high-availability
firewall-cmd --reload

# Copy configuration files
cp ../configs/corosync.conf /etc/corosync/corosync.conf
cp ../configs/pacemaker.conf /etc/pacemaker/pacemaker.conf

# Authenticate nodes (replace with actual node names)
pcs cluster auth node1 node2

# Setup cluster
pcs cluster setup --name mycluster node1 node2

# Start cluster
pcs cluster start --all

echo "Cluster setup complete. Please review and adjust configurations as needed."