#!/bin/bash

# Install:
# - brew: /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
# - kitty: https://github.com/kovidgoyal/kitty/releases
# - tmux: brew install tmux
# - fzf: brew install fzf && $(brew --prefix)/opt/fzf/install
# - rg: brew install ripgrep
# - bat: brew install bat
# - neovim: brew install nvim
# - https://github.com/leits/MeetingBar
# - spotify

# Checkout raycast alfred replacement

rm -rf $HOME/.config/kitty
ln -s "$(pwd)/kitty" $HOME/.config/kitty

rm -f $HOME/.zshrc
ln -s "$(pwd)/zshrc" $HOME/.zshrc
rm -rf $HOME/.config/zsh
ln -s "$(pwd)/zsh" $HOME/.config/zsh
# Add something about zprofile

rm -rf $HOME/.config/nvim
ln -s "$(pwd)/nvim" $HOME/.config/nvim

rm -f $HOME/.tmux.conf
ln -s "$(pwd)/tmux.conf" $HOME/.tmux.conf
rm -rf $HOME/.config/tmux
ln -s "$(pwd)/tmux" $HOME/.config/tmux

rm -rf $HOME/.config/wtf
ln -s "$(pwd)/wtf" $HOME/.config/wtf

rm -rf $HOME/.gitconfig
ln -s "$(pwd)/gitconfig" $HOME/.gitconfig

rm -rf $HOME/.asdfrc
ln -s "$(pwd)/asdfrc" $HOME/.asdfrc
