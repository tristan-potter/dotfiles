#!/bin/bash

# Install homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install vim
brew install vim --override-system-vi

# Install other things
brew install antigen
brew install cmake
brew install go
brew install node
brew install npm
brew install rustup
brew install rg
brew install fzf
brew install exa

# figure out how to install alacritty as a script

# After doing a vim plugin install, compile YCM
cd ~/.vim/bundle/YouCompleteMe
./install.py --gocode-completer --tern-completer --clang-completer

# install rust
rustup-init
