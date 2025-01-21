# Load Homebrew's zsh-completions
if [ -d "/opt/homebrew/share/zsh/site-functions" ]; then
  fpath+=("/opt/homebrew/share/zsh/site-functions")
fi

[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# Enable color support
autoload -U colors && colors

eval "$(pyenv init - zsh)"
eval "$(starship init zsh)"

[ -f ~/.zsh_aliases ] && source ~/.zsh_aliases
[ -f ~/.zsh_functions ] && source ~/.zsh_functions

# Force 256 colors if needed (rarely necessary)
[[ $TERM == "xterm" ]] && export TERM="xterm-256color"


# case insensitive path-completion
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*'
# partial completion suggestions
zstyle ':completion:*' list-suffixeszstyle ':completion:*' expand prefix suffix

# Key bindings
bindkey "^[[A" history-beginning-search-backward    # Up arrow
bindkey "^[[B" history-beginning-search-forward     # Down arrow
bindkey "^[3;3~" kill-word                         # Alt-Delete
bindkey "^[[3~" delete-char                        # Delete

# Case insensitive globbing
setopt NO_CASE_GLOB

# Correct command spelling
setopt CORRECT
setopt CORRECT_ALL

# History settings
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
HIST_STAMPS="yyyy-mm-dd"

# More data to the history file
setopt EXTENDED_HISTORY

# share history across multiple zsh sessions
setopt SHARE_HISTORY

# append to history
setopt APPEND_HISTORY

# adds commands as they are typed, not at shell exit
setopt INC_APPEND_HISTORY

# expire duplicates first
setopt HIST_EXPIRE_DUPS_FIRST 
# do not store duplications
setopt HIST_IGNORE_DUPS
#ignore duplicates when searching
setopt HIST_FIND_NO_DUPS
# removes blank lines from history
setopt HIST_REDUCE_BLANKS

# ?
setopt HIST_IGNORE_SPACE

# ?
setopt HIST_VERIFY

eval "$(zoxide init zsh)"

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)

source /opt/homebrew/opt/git-extras/share/git-extras/git-extras-completion.zsh

source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh