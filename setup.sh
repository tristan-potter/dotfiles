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
brew install reattach-to-user-namespace

# quicklook plugins
brew cask install qlstephen
brew cask install qlmarkdown
brew cask install quicklook-json
brew cask install qlprettypatch
brew cask install quicklook-csv
brew cask install betterzipql
brew cask install webpquicklook
brew cask install suspicious-package

# figure out how to install alacritty as a script

# After doing a vim plugin install, compile YCM
cd ~/.vim/bundle/YouCompleteMe
./install.py --gocode-completer --tern-completer --clang-completer

# install rust
rustup-init
