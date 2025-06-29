
#!/bin/bash
set -e

echo "Installing shells and starship prompt..."

# Update package lists (no sudo since running as user with privileges)
sudo apt update
sudo apt install -y bash zsh fish curl git

echo "Setting Zsh as default shell for user $USER..."
chsh -s "$(which zsh)" || echo "Failed to change shell, you might need to do it manually."

DOTFILES_DIR="$HOME/BootstrapLinuxMint/dotfiles/"

echo "Creating symlinks for dotfiles from $DOTFILES_DIR..."
mkdir -p "$HOME/.config/fish"

ln -sf "$DOTFILES_DIR/bash/.bashrc" "$HOME/.bashrc"
ln -sf "$DOTFILES_DIR/zsh/.zshrc" "$HOME/.zshrc"
ln -sf "$DOTFILES_DIR/fish/config.fish" "$HOME/.config/fish/config.fish"

echo "Installing starship prompt..."
curl -fsSL https://starship.rs/install.sh | bash -s -- -y

echo "Dotfiles and shell setup done."
echo "Please restart your terminal or log out and back in for changes to take effect."
