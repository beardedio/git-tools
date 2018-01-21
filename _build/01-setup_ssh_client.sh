#!/bin/bash
set -euo pipefail

# Setup global ssh client config
echo "Setting up global ssh client config"
echo "Host *" >> /etc/ssh/ssh_config
echo "StrictHostKeyChecking no" >> /etc/ssh/ssh_config
