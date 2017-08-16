# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=/usr/local/go/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
export ZSH_CUSTOM=$ZSH/custom

export GOPATH=$HOME
export GOBIN=$GOPATH/bin
export PATH=$GOBIN:$PATH

export RUSTBIN=~/.cargo/bin directory
export PATH=$RUSTBIN:$PATH

export PKG_CONFIG_PATH=/usr/local/opt/imagemagick@6/lib/pkgconfig:$PKG_CONFIG_PATH

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

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# used intheloop 
ZSH_THEME=""

# Use hyphen-insensitive completion. Case sensitive completion must be off. _ 
# and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git, vi-mode, colored-man-pages, history-substring-search, zsh-autosuggestions, zsh-syntax-highlighting)

# source $ZSH/oh-my-zsh.sh
# source $ZSH/plugins/git/git.plugin.zsh
# source $ZSH/plugins/vi-mode/vi-mode.plugin.zsh
# source $ZSH/plugins/colored-man-pages/colored-man-pages.plugin.zsh
# source $ZSH/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh


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

[ -f /opt/dev/dev.sh ] && source /opt/dev/dev.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# zsh options
source $(brew --prefix)/share/antigen/antigen.zsh

# oh-my-zsh is useful
antigen use oh-my-zsh

antigen bundle git
antigen bundle vi-mode
antigen bundle colored-man-pages
antigen bundle history-substring-search
antigen bundle zsh-autosuggestions

# independent plugins
antigen bundle mafredri/zsh-async
antigen bundle sindresorhus/pure
antigen bundle zsh-users/zsh-syntax-highlighting

antigen apply

