#!/usr/bin/env bash

# logging
function e_header() { echo -e "\n\033[1m$@\033[0m"; }

# install homebrew if not already there
if [[ ! "$(type -P brew)" ]]; then
    e_header '🍳 Installing homebrew'
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

e_header '🍳 Updating homebrew'
# Make sure we’re using the latest Homebrew.
brew update
# Upgrade any already-installed formulae.
brew upgrade

# tap Brew Bundle
e_header '📚 Installing Bundle'
brew tap Homebrew/bundle

e_header '🍏 Enter your apple id, followed by [ENTER]:'
read appleid
mas signin $appleid

e_header '💾 Installing Applications and command line tools'
cask_args appdir: '/Applications'
# restore installed apps
brew bundle
e_header '💾 Installed all apps and tools from Brewfile'

e_header '🚿 Cleaning up'

# Switch to using brew-installed bash as default shell
if ! fgrep -q '/usr/local/bin/bash' /etc/shells; then
  echo '/usr/local/bin/bash' | sudo tee -a /etc/shells;
  chsh -s /usr/local/bin/bash;
fi;

# Remove outdated versions from the cellar.
brew cleanup
