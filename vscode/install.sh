#!/bin/bash


while read EXTENSION
do
    echo "Install VSCode Extension: $EXTENSION"
    code --install-extension $EXTENSION
done < $HOME/.dotfiles/vscode/extensions.txt


mv $HOME/Library/Application\ Support/Code/User $HOME/Library/Application\ Support/Code/User.bak
ln -s $HOME/.dotfiles/vscode $HOME/Library/Application\ Support/Code/User