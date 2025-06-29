
#!/bin/bash
set -e

echo "Updating system packages..."
apt update && apt upgrade -y

echo "Installing essential packages..."
ESSENTIAL_PACKAGES="git curl wget vim htop build-essential python3 python3-pip docker.io"
apt install -y $ESSENTIAL_PACKAGES

echo "Enabling and starting Docker service..."
systemctl enable docker
systemctl start docker

# Add original user to docker group if SUDO_USER is set
if [ ! -z "$SUDO_USER" ]; then
  usermod -aG docker "$SUDO_USER" || echo "Warning: Could not add $SUDO_USER to docker group."
fi

echo "System setup done."
