
# Basic Bash config

# Enable color support for ls and grep
if [ -x /usr/bin/dircolors ]; then
  eval "$(dircolors -b)"
  alias ls='ls --color=auto'
  alias grep='grep --color=auto'
fi

# Add user bin to PATH
export PATH="$HOME/bin:$PATH"

# Prompt
PS1='\[\e[32m\]\u@\h:\w\$ \[\e[0m\]'
