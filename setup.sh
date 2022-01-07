#!/bin/bash

# Install kitty
# Install tmux
# Install neovim
# Install https://github.com/leits/MeetingBar
# Install spotify

rm -rf $HOME/.config/kitty
ln -s "$(pwd)/kitty" $HOME/.config/kitty

rm -f $HOME/.zshrc
ln -s "$(pwd)/zshrc" $HOME/.zshrc

rm -rf $HOME/.config/nvim
ln -s "$(pwd)/nvim" $HOME/.config/nvim

rm -f $HOME/.tmux.conf
ln -s "$(pwd)/tmux.conf" $HOME/.tmux.conf

rm -rf $HOME/.config/tmux
ln -s "$(pwd)/tmux" $HOME/.config/tmux
