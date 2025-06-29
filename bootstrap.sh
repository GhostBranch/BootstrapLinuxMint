
#!/bin/bash
set -e

if [[ $EUID -ne 0 ]]; then
  echo "Please run as root: sudo ./bootstrap.sh"
  exit 1
fi

echo "Starting full bootstrap..."

# Run system setup as root
./bootstrapSystem.sh

# Run dotfiles setup as the original user (not root)
if [ -z "$SUDO_USER" ]; then
  echo "SUDO_USER is not set, running dotfiles setup as root (not recommended)."
  ./bootstrapDotFiles.sh
else
  sudo -u "$SUDO_USER" bash ./bootstrapDotFiles.sh
fi

echo "Bootstrap complete!"

