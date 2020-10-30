# load dev, but only if present and the shell is interactive
if [[ -f /opt/dev/dev.sh ]] && [[ $- == *i* ]]; then
  source /opt/dev/dev.sh
fi

export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=/usr/local/go/bin:$PATH

export GOPATH=$HOME
export GOBIN=$GOPATH/bin
export PATH=$GOBIN:$PATH

export RUSTBIN=~/.cargo/bin directory
export PATH=$RUSTBIN:$PATH

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
