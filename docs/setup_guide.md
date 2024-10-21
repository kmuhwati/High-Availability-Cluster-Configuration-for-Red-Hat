# Detailed Setup Guide for High-Availability Cluster

This guide provides step-by-step instructions for setting up a high-availability cluster using Red Hat Enterprise Linux.

## Prerequisites

- Red Hat Enterprise Linux 8 or later installed on all nodes
- Network connectivity between all nodes
- Root access to all nodes

## Steps

1. Install required packages on all nodes:
   ```
   sudo yum install -y pacemaker pcs corosync
   ```

2. Set up the hacluster user password on all nodes:
   ```
   sudo passwd hacluster
   ```

3. Enable and start the pcsd service on all nodes:
   ```
   sudo systemctl enable pcsd
   sudo systemctl start pcsd
   ```

4. Configure firewall on all nodes:
   ```
   sudo firewall-cmd --permanent --add-service=high-availability
   sudo firewall-cmd --reload
   ```

5. Authenticate the cluster nodes (run on one node):
   ```
   sudo pcs cluster auth node1 node2
   ```

6. Create the cluster (run on one node):
   ```
   sudo pcs cluster setup --name mycluster node1 node2
   ```

7. Start the cluster services on all nodes:
   ```
   sudo pcs cluster start --all
   ```

8. Configure cluster resources:
   ```
   sudo pcs resource create myresource ocf:heartbeat:IPaddr2 ip=192.168.1.10 cidr_netmask=24 op monitor interval=10s
   ```

9. Set stonith and quorum policy:
   ```
   sudo pcs property set stonith-enabled=true
   sudo pcs property set no-quorum-policy=ignore
   ```

10. Verify the cluster status:
    ```
    sudo pcs status
    ```

For more detailed information on each step and advanced configurations, please refer to the Red Hat documentation.