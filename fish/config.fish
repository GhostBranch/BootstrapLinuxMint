
# Basic fish config

# Add user bin to PATH
set -gx PATH $HOME/bin $PATH

# Enable fish completions and history (default)

# Aliases
alias ll="ls -lah"

# Starship prompt integration
if type -q starship
  starship init fish | source
end
