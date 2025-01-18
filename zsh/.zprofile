
eval "$(/opt/homebrew/bin/brew shellenv)"

# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init.zsh 2>/dev/null || :

# Ensure compinit is loaded
autoload -Uz compinit && compinit

eval "$(fnm env --use-on-cd --shell zsh)"