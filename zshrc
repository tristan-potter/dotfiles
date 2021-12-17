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

export PATH=/opt/dev/bin/user:$PATH
export PATH=$HOME/.dotfiles/util:$PATH

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

autoload -Uz up-line-or-beginning-search
autoload -Uz down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey '\eOA' up-line-or-beginning-search
bindkey '\e[A' up-line-or-beginning-search
bindkey '\eOB' down-line-or-beginning-search
bindkey '\e[B' down-line-or-beginning-search

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
alias tnew="tmux new-session -s"

[ -f /opt/dev/dev.sh ] && source /opt/dev/dev.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

tm () {
    local session
    newsession=${1:-new}
    session=$(tmux list-sessions -F "#{session_name}" | \
    fzf --query="$1" --select-1 --exit-0)  && tmux attach-session -t "$session" || tmux new-session -s $newsession
}
if [ -e /Users/tristanpotter/.nix-profile/etc/profile.d/nix.sh ]; then . /Users/tristanpotter/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

[[ -f /opt/dev/sh/chruby/chruby.sh ]] && type chruby >/dev/null 2>&1 || chruby () { source /opt/dev/sh/chruby/chruby.sh; chruby "$@"; }
export PATH="/usr/local/sbin:$PATH"

[[ -x /usr/local/bin/brew ]] && eval $(/usr/local/bin/brew shellenv)
