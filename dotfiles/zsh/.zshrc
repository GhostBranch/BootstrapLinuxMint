
# Load Antidote plugin manager silently
if [[ ! -d ${HOME}/.antidote ]]; then
  git clone --quiet https://github.com/mattmc3/antidote.git ${HOME}/.antidote
fi
source ${HOME}/.antidote/antidote.zsh &>/dev/null

# Load plugins silently

source <(antidote bundle <<EOBUNDLES
zsh-users/zsh-autosuggestions
zsh-users/zsh-syntax-highlighting
zdharma-continuum/fast-syntax-highlighting
zsh-users/zsh-completions
EOBUNDLES
)


# History settings
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS

# Completion settings
autoload -Uz compinit &>/dev/null
compinit &>/dev/null
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# Starship prompt (only if installed), silent
if command -v starship &>/dev/null; then
  eval "$(starship init zsh)" &>/dev/null
fi


alias chatgpt='xdg-open https://chat.openai.com'

# Show system info
neofetch


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
