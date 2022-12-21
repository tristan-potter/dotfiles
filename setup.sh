#!/bin/bash

# Convinience function for installing brew things
brew_install() {
  echo "Installing $1"
  if brew list $1 &>/dev/null; then
    echo "${1} is already installed"
  else
    brew install $1 && echo "Finished installing $1"
  fi
}

setup_brew() {
  echo "Installing Homebrew"
  if [[ -x /usr/local/bin/brew ]]; then
    echo "Homebrew is already installed"
  else
    bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo "Finished installing Homebrew"
  fi
}

setup_kitty() {
  echo "Installing Kitty"
  if [[ -x /Applications/kitty.app/Contents/MacOS/kitty ]]; then
    echo "Kitty is already installed"
    echo "Setting up Kitty"
    rm -rf $HOME/.config/kitty
    ln -s "$(pwd)/kitty" $HOME/.config/kitty
  else
    echo "Please install Kitty"
    echo "  Download the DMG from https://github.com/kovidgoyal/kitty/releases"
  fi
}

setup_zsh(){
  echo "Setting up ZSH"
  rm -f $HOME/.zshrc
  ln -s "$(pwd)/zshrc" $HOME/.zshrc
  rm -rf $HOME/.config/zsh
  ln -s "$(pwd)/zsh" $HOME/.config/zsh
  # Add something about zprofile
}

setup_nvim(){
  brew_install "neovim"
  echo "Setting up Neovim"
  rm -rf $HOME/.config/nvim
  ln -s "$(pwd)/nvim" $HOME/.config/nvim
  ln -s "$(pwd)/themer/out/macos/vim/ThemerVim.vim" $HOME/.config/nvim/colors/themer.vim
}

setup_tmux() {
  brew_install "tmux"
  echo "Setting up Tmux"
  rm -f $HOME/.tmux.conf
  ln -s "$(pwd)/tmux.conf" $HOME/.tmux.conf
  rm -rf $HOME/.config/tmux
  ln -s "$(pwd)/tmux" $HOME/.config/tmux
}

setup_wtf() {
  echo "Setting up WTF"
  rm -rf $HOME/.config/wtf
  ln -s "$(pwd)/wtf" $HOME/.config/wtf
}

setup_git() {
  echo "Setting up git"
  rm -rf $HOME/.gitconfig
  ln -s "$(pwd)/gitconfig" $HOME/.gitconfig

  rm -rf $HOME/.gitignore
  ln -s "$(pwd)/gitignore" $HOME/.gitignore
}

setup_asdf() {
  brew_install "asdf"
  echo "Adding ASDF plugins"
  asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
  asdf plugin add ruby https://github.com/asdf-vm/asdf-ruby.git
  # Can provide global golang packages with $HOME/.default-golang-pkgs
  asdf plugin-add golang https://github.com/kennyp/asdf-golang.git
  asdf plugin-add rust https://github.com/code-lever/asdf-rust.git

  echo "Setting up ASDF"
  rm -rf $HOME/.asdfrc
  ln -s "$(pwd)/asdf/asdfrc" $HOME/.asdfrc
  rm -rf $HOME/.tool-versions
  ln -s "$(pwd)/asdf/tool-versions" $HOME/.tool-versions
  rm -rf $HOME/.default-gems
  ln -s "$(pwd)/asdf/default-gems" $HOME/.default-gems
  echo "Installing ASDF plugins"
  asdf install
}

setup_tools() {
  brew_install "git"
  brew_install "bat"
  brew_install "ripgrep"
  brew_install "fzf" && $(brew --prefix)/opt/fzf/install
}

# Install:
# - go: https://go.dev/doc/install
# - rust: curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
# - heads up for meetings in menu bar: https://github.com/leits/MeetingBar
# - preview (quick look) for code and other text: https://github.com/sbarex/SourceCodeSyntaxHighlight
# - preview (quick look) for markdown (rendered): https://github.com/sbarex/QLMarkdown
# - spotify
# - solargraph for ruby language server: gem install solargraph

# Checkout raycast alfred replacement

setup_brew
setup_kitty
setup_zsh
setup_nvim
setup_tmux
setup_wtf
setup_git
setup_asdf
setup_tools

