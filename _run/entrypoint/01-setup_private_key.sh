#!/bin/bash
set -euo pipefail

# Install a private key
if [ "${SSH_PRIVATE_KEY:-null}" != null ]; then
    echo "Adding a ssh key"
    echo "$SSH_PRIVATE_KEY" | tr -d '\r' > /etc/ssh/rsa.pem
    chmod 600 /etc/ssh/rsa.pem
    echo "IdentityFile /etc/ssh/rsa.pem" >> /etc/ssh/ssh_config
fi
