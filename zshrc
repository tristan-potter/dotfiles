
# Use files for FZF
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'
export EDITOR='vim'
export GOPATH="$GOPATH:$HOME/src"

# Plugins
# TODO this doesn't seem to be working
[ -f $HOME/.config/zsh/antigenrc ] && source $HOME/.config/zsh/antigenrc

tm () {
    local session
    newsession=${1:-new}
    session=$(tmux list-sessions -F "#{session_name}" | \
    fzf --query="$1" --select-1 --exit-0)  && tmux attach-session -t "$session" || tmux new-session -s $newsession
}
# Pulled from https://github.com/ohmyzsh/ohmyzsh/blob/master/lib/git.zsh
# Remove once I get antigen working
function __git_prompt_git() {
  GIT_OPTIONAL_LOCKS=0 command git "$@"
}

# Outputs the name of the current branch
# Usage example: git pull origin $(git_current_branch)
# Using '--quiet' with 'symbolic-ref' will not cause a fatal error (128) if
# it's not a symbolic ref, but in a Git repo.
function git_current_branch() {
  local ref
  ref=$(__git_prompt_git symbolic-ref --quiet HEAD 2> /dev/null)
  local ret=$?
  if [[ $ret != 0 ]]; then
    [[ $ret == 128 ]] && return  # no git repo.
    ref=$(__git_prompt_git rev-parse --short HEAD 2> /dev/null) || return
  fi
  echo ${ref#refs/heads/}
}

function set-prompt() {
  local prompt_pwd='%B%F{blue}%1~%f%b'
  local current_branch="$(git_current_branch)"
  local prompt_current_branch="%B%F{green}"$current_branch"%f%b"
  local prompt_exit_status='%(?.%F{green}√.%F{red}?%?)%f'
  local prompt_cursor='%B%F{blue}⮕ %f%b'
  PROMPT=$prompt_pwd' '$prompt_current_branch""$'\n'$prompt_cursor

  # local top_left='%~'
  # local top_right="$(git rev-parse --abbrev-ref HEAD 2>/dev/null)"
  # local bottom_left='%# '
  # local bottom_right='%T'

  # PROMPT="$(fill-line "$top_left" "$top_right")"$'\n'$bottom_left
  RPROMPT=$prompt_exit_status
}
autoload -Uz add-zsh-hook
add-zsh-hook precmd set-prompt

# Vim mode
bindkey -v

alias vim="nvim"
alias zshconfig="vim ~/.zshrc"
alias mkdir="mkdir -p"
alias gs="git status"
alias gglog="git log --pretty=format:\"%C(yellow)%h%Cred%d\\ %Creset%s%Cblue\\ [%cn]\" --decorate"
alias today="date +'%Y-%m-%d'"
alias tnew="tmux new-session -s"
alias ggpull="git pull origin $(git_current_branch)"
alias ggpush="git push origin $(git_current_branch)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Auto-generated
[[ -f /opt/dev/sh/chruby/chruby.sh ]] && type chruby >/dev/null 2>&1 || chruby () { source /opt/dev/sh/chruby/chruby.sh; chruby "$@"; }

[[ -x /opt/homebrew/bin/brew ]] && eval $(/opt/homebrew/bin/brew shellenv)

[ -f /opt/dev/dev.sh ] && source /opt/dev/dev.sh
