
#!/bin/bash
set -e

echo "Installing shells and starship prompt..."
sudo apt update
sudo apt install -y bash zsh fish curl git

echo "Setting Zsh as default shell..."
chsh -s $(which zsh)

echo "Creating symlinks for dotfiles..."
mkdir -p ~/.config/fish
ln -sf ~/dotfiles/bash/.bashrc ~/.bashrc
ln -sf ~/dotfiles/zsh/.zshrc ~/.zshrc
ln -sf ~/dotfiles/fish/config.fish ~/.config/fish/config.fish

echo "Installing starship prompt..."
curl -fsSL https://starship.rs/install.sh | bash

echo "Done! Please restart your terminal."
