#!/bin/bash

f() {
  local black=$(tput setaf 0)
  local red=$(tput setaf 1)
  local green=$(tput setaf 2)
  local yellow=$(tput setaf 3)
  local lime_yellow=$(tput setaf 190)
  local powder_blue=$(tput setaf 153)
  local blue=$(tput setaf 4)
  local magenta=$(tput setaf 5)
  local cyan=$(tput setaf 6)
  local white=$(tput setaf 7)
  local bright=$(tput bold)
  local blink=$(tput blink)
  local reverse=$(tput smso)
  local underline=$(tput smul)

  local reset=$(tput sgr0)
  local title_width=15
  local title_format="${blue}%-${title_width}s${reset}"

  case $1 in
    'info')
      echo "${title_format}%s\\n"
      ;;
    'error')
      echo "${title_format}${red}%s${reset}\\n"
      ;;
  esac
}

# Convinience for printing
log() {
  local step_name=$1

  printf "$(f info)" "${step_name}" "${@:2}"
}

error() {
  local step_name=$1

  printf "$(f error)" "${step_name}" "${@:2}" 1>&2
}

log_step() {
  log "$1" "Initializing step"
}

# Convinience function for installing brew things
brew_install() {
  local step=$1
  local name=$2
  local post_install=$3

  log "${step}" "Verifying ${name} is installed with Homebrew."
  if brew list ${name} &>/dev/null; then
    log "${step}" "${name} is already installed"
  else
    log "${step}" "${name} is not installed. Installing..."
    brew install ${name}
    if (( $? != 0 )); then
      error "${step}" "Installing ${name} failed."
      return 1;
    fi

    if ! [[ "${post_install}" -eq 0 ]]; then
      log "${step}" "Running post-install script for ${name}:"
      log "${step}" "\t ${post_install}"
      # TODO this feels wrong
      $(post_install)
      if (( $? != 0 )); then
        error "${step}" "Post-install script for ${name} failed."
        return 1;
      fi

      log "${step}" "Post-install script done."
    fi
    log "${step}" "Finished installing ${name} with Homebrew."
  fi
}

setup_brew() {
  local step_name="Homebrew"
  log_step "$step_name"

  log "$step_name" "Verifying presence..."
  if [[ -x /usr/local/bin/brew ]]; then
    log "$step_name" "Already installed."
  else
    log "$step_name" "Not found. Installing..."
    bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  fi
  log "$step_name" "Finished."
}

setup_kitty() {
  local step_name="Kitty"
  log_step "$step_name"

  log "$step_name" "Verifying presence..."
  if [[ -x /Applications/kitty.app/Contents/MacOS/kitty ]]; then
    log "$step_name" "Already installed."
    log "$step_name" "Setting up configurations..."
    rm -rf $HOME/.config/kitty
    ln -s "$(pwd)/kitty" $HOME/.config/kitty
    if (( $? != 0 )); then
      error "${step}" "Linking configuration file failed with ${?}."
      return 1;
    fi
    log "$step_name" "Finished."
  else
    error "${step}" "Not found. Please download the DMG for Kitty from\n\t https://github.com/kovidgoyal/kitty/releases"
  fi
}

setup_zsh(){
  local step_name="ZSH"
  local zshrc="$HOME/.zshrc"
  local zsh_config="$HOME/.config/zsh"

  log_step "$step_name"

  log "$step_name" "Removing existing configurations"
  rm -f "${zshrc}"
  rm -rf "${zsh_config}"

  log "$step_name" "Linking configuration files."
  ln -s "$(pwd)/zshrc" $HOME/.zshrc
  # TODO extract linking logic into a helper
  if (( $? != 0 )); then
    error "${step}" "Linking configuration file failed with ${?}."
    return 1;
  fi
  ln -s "$(pwd)/zsh" $HOME/.config/zsh
  if (( $? != 0 )); then
    error "${step}" "Linking configuration file failed with ${?}."
    return 1;
  fi
  # TODO: Add something about zprofile
  log "$step_name" "Finished."
}

setup_nvim(){
  local step_name="NeoVIM"
  log_step "${step_name}"

  brew_install "${step_name}" "neovim"
  if (( $? != 0 )); then
    error "${step}" "Installation failed."
    return 1;
  fi

  log "$step_name" "Removing existing configurations"
  rm -rf $HOME/.config/nvim

  log "$step_name" "Linking configuration files..."
  ln -s "$(pwd)/nvim" $HOME/.config/nvim
  if (( $? != 0 )); then
    error "${step}" "Linking configuration file failed with ${?}."
    return 1;
  fi

  if ! [[ -f $HOME/.config/nvim/colors/themer.vim ]]; then
    ln -s "$(pwd)/themer/out/macos/vim/ThemerVim.vim" $HOME/.config/nvim/colors/themer.vim
  fi

  log "$step_name" "Finished."
}

setup_tmux() {
  local step_name="tmux"
  log_step "${step_name}"

  brew_install "${step_name}" "tmux"

  log "$step_name" "Removing existing configurations"
  rm -f $HOME/.tmux.conf
  rm -rf $HOME/.config/tmux

  log "$step_name" "Linking configuration files..."
  ln -s "$(pwd)/tmux.conf" $HOME/.tmux.conf
  if (( $? != 0 )); then
    error "${step}" "Linking configuration file failed with ${?}."
    return 1;
  fi
  ln -s "$(pwd)/tmux" $HOME/.config/tmux
  if (( $? != 0 )); then
    error "${step}" "Linking configuration file failed with ${?}."
    return 1;
  fi
  log "$step_name" "Finished."
}

setup_wtf() {
  local step_name="wtf"
  log_step "${step_name}"

  echo "Setting up WTF"
  rm -rf $HOME/.config/wtf
  ln -s "$(pwd)/wtf" $HOME/.config/wtf
}

setup_git() {
  local step_name="git"
  log_step "${step_name}"

  brew_install "${step_name}" "git"

  echo "Setting up git"
  rm -rf $HOME/.gitconfig
  ln -s "$(pwd)/gitconfig" $HOME/.gitconfig

  rm -rf $HOME/.gitignore
  ln -s "$(pwd)/gitignore" $HOME/.gitignore
}

setup_asdf() {
  local step_name="asdf"
  log_step "${step_name}"

  echo "Setting up ASDF"
  brew_install "${step_name}" "asdf"

  rm -rf $HOME/.asdfrc
  ln -s "$(pwd)/asdf/asdfrc" $HOME/.asdfrc
  rm -rf $HOME/.tool-versions
  ln -s "$(pwd)/asdf/tool-versions" $HOME/.tool-versions
  echo "Installing ASDF plugins"
  asdf install
}

check_asdf_dependency() {
  if ! asdf &>/dev/null; then
    echo "Required dependency `asdf` is missing"
    return 1;
  fi
}

add_asdf_plugin() {
  local plugin_name=$1
  local plugin_url=$2
  check_asdf_dependency
  asdf plugin add "$plugin_name" "$plugin_url"
  if (( $? != 0 )); then
    echo "Failed to add asdf plugin $plugin_name"
  fi
}

asdf_add_global() {
  local plugin=$1
  check_asdf_dependency

  if ! [[ -f "~/.tool-versions" ]]; then
    echo "Dependency ~/.tool-versions not found."
    return 1
  fi

  if ! grep -Fq "$plugin" "~/.tool-versions"; then
    asdf global "$plugin" "latest"
  else
    echo "Plugin $plugin already added to global tool-versions"
  fi
}

setup_global_nodejs() {
  local step_name="NodeJS"
  log_step "${step_name}"
  add_asdf_plugin "nodejs" "https://github.com/asdf-vm/asdf-nodejs.git"
  asdf_add_global "nodejs"
}

setup_global_ruby() {
  local step_name="Ruby"
  log_step "${step_name}"
  add_asdf_plugin "ruby" "https://github.com/asdf-vm/asdf-ruby.git"

  asdf_add_global "ruby"

  rm -rf $HOME/.default-gems
  ln -s "$(pwd)/asdf/default-gems" $HOME/.default-gems
}

setup_global_golang() {
  local step_name="Golang"
  log_step "${step_name}"
  # Can provide global golang packages with $HOME/.default-golang-pkgs
  add_asdf_plugin "golang" "https://github.com/kennyp/asdf-golang.git"
  asdf_add_global "golang"
}

setup_global_rust() {
  local step_name="Rust"
  log_step "${step_name}"
  add_asdf_plugin "rust" "https://github.com/code-lever/asdf-rust.git"
  asdf_add_global "rust"
}

setup_postgres() {
  local step_name="PostgreSQL"
  log_step "${step_name}"
  add_asdf_plugin "postgres" "https://github.com/smashedtoatoms/asdf-postgres.git"

  # see https://github.com/smashedtoatoms/asdf-postgres#mac
  brew_install "${step_name}" "gcc"
  brew_install "${step_name}" "readline"
  brew_install "${step_name}" "zlib"
  brew_install "${step_name}" "curl"
  brew_install "${step_name}" "ossp-uuid"
}

setup_xcode_command_line_tools() {
  local step_name="XCode Command Line Tools"
  log_step "${step_name}"

  echo "[XCode Command Line Tools] Verifying presence..."
  if ! xcode-select -p &>/dev/null; then
    echo "[XCode Command Line Tools] Not found, installing..."
    xcode-select --install
    echo "[XCode Command Line Tools] Done."
  else
    echo "[XCode Command Line Tools] Installed."
  fi
}

setup_tools() {
  local step_name="Miscellaneous Developer Tools"
  log_step "${step_name}"

  brew_install "${step_name}" "bat"
  brew_install "${step_name}" "jq"
  brew_install "${step_name}" "ripgrep"

  brew_install "${step_name}" "fzf" "$(brew --prefix)/opt/fzf/install"
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
main() {
  setup_brew
  setup_kitty
  setup_zsh
  setup_nvim
  setup_tmux
  setup_wtf
  setup_git
  setup_asdf
  setup_global_nodejs
  setup_global_ruby
  setup_global_rust
  setup_postgres
  setup_xcode_command_line_tools
  setup_tools
}

main
