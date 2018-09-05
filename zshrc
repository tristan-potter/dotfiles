# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=/usr/local/go/bin:$PATH

export GOPATH=$HOME
export GOBIN=$GOPATH/bin
export PATH=$GOBIN:$PATH

export RUSTBIN=$HOME/.cargo/bin directory
export PATH=$RUSTBIN:$PATH

export FLUTTERBIN=$HOME/src/flutter/bin
export PATH=$FLUTTERBIN:$PATH

export PKG_CONFIG_PATH=/usr/local/opt/imagemagick@6/lib/pkgconfig:$PKG_CONFIG_PATH

source $HOME/.dotfiles/antigenrc

# if I make a custom prompt, i will need this
# autoload -U colors
# colors

# Default command to run when :Files is called in vim
# --files: List files that would be searched but do not search
# # --no-ignore: Do not respect .gitignore, etc...
# # --hidden: Search hidden files and folders
# # --follow: Follow symlinks
# # --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'
setopt autocd histignoredups notify 
unsetopt beep

# vi-mode
bindkey -v
#export KEYTIMEOUT=1 #make escape delay 0.1s

# User configuration

# Preferred editor for local and remote sessions
export EDITOR='vim'
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

alias zshconfig="vim ~/.zshrc"
alias viminstall="vim +PluginInstall +qall"
alias mkdir="mkdir -p"
alias gs="git status"
alias gglog="git log --pretty=format:\"%C(yellow)%h%Cred%d\\ %Creset%s%Cblue\\ [%cn]\" --decorate"
alias today="date +'%Y-%m-%d'"
alias tnew="tmux new-session -s ${PWD##*/}"

[ -f /opt/dev/dev.sh ] && source /opt/dev/dev.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
