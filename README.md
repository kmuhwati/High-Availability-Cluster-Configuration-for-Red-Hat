# High-Availability Cluster Configuration for Red Hat

Author: Kumbirai Muhwati

## Overview

This repository contains configuration files and scripts to set up a high-availability cluster using Red Hat Enterprise Linux (RHEL).

## Project Structure

```
.
├── README.md
├── configs/
│   ├── cluster.conf
│   ├── corosync.conf
│   └── pacemaker.conf
├── scripts/
│   ├── setup_cluster.sh
│   ├── start_resource.sh
│   └── stop_resource.sh
└── docs/
    └── setup_guide.md
```

## Prerequisites

- Red Hat Enterprise Linux 8 or later
- Pacemaker and Corosync installed
- At least two nodes for the cluster

## Quick Start

1. Clone this repository to your local machine.
2. Review and modify the configuration files in the `configs/` directory to match your environment.
3. Run the setup script:

   ```
   ./scripts/setup_cluster.sh
   ```

4. Follow the prompts to complete the cluster setup.

## Configuration Files

- `configs/cluster.conf`: Main cluster configuration file
- `configs/corosync.conf`: Corosync configuration for cluster communication
- `configs/pacemaker.conf`: Pacemaker resource configuration

## Scripts

- `scripts/setup_cluster.sh`: Main setup script for the cluster
- `scripts/start_resource.sh`: Script to start a cluster resource
- `scripts/stop_resource.sh`: Script to stop a cluster resource

## Documentation

Detailed setup instructions and best practices can be found in `docs/setup_guide.md`.

## Contributing

Contributions to improve the configurations or scripts are welcome. Please submit a pull request with your proposed changes.

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Disclaimer

These configurations and scripts are provided as examples and should be thoroughly tested and adapted to your specific environment before use in production.