
# Use rg files for FZF by default
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'
export FZF_DEFAULT_OPTS='--height ~20% --layout=reverse --border'
export EDITOR='vim'
# Set bat as the default for man
if [[ -x $(command -v 'bat') ]]; then
  export MANPAGER="sh -c 'col -bx | bat -l man -p'"
fi

# Plugins
[ -f $HOME/.config/zsh/antigenrc ] && source $HOME/.config/zsh/antigenrc

tm () {
    local folder=$(basename "$PWD")
    local create_opt="New session: $folder"
    local session
    session=$( (echo "$create_opt"; tmux list-sessions -F "#{session_name}" 2>/dev/null) | \
        fzf --query="${1:-}" --select-1 --exit-0)
    if [[ "$session" == "$create_opt" ]]; then
        tmux new-session -As "$folder" -c "$PWD"
    elif [[ -n "$session" ]]; then
        tmux attach-session -t "$session"
    else
        tmux new-session -As "${1:-$folder}" -c "$PWD"
    fi
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

function prompt_host() {
  local local_id=".local"
  local spin_id="spin"
  if [[ $HOST =~ $local_id ]]; then
    echo "%F{blue}󰍛 | %f"
  elif [[ $HOST =~ $spin_id ]]; then
    echo "%F{blue}꩜ | %f"
  elif [[ $HOST != *.* ]]; then
    echo "%F{blue}󰍛 | %f"
  else
    echo "%F{blue}${HOST%%.*} | %f"
  fi
}

function set_prompt() {
  local prompt_pwd='%B%F{blue}%3~%f%b'
  local current_branch="$(git_current_branch)"
  local prompt_current_branch="%B%F{green}"$current_branch"%f%b"
  local prompt_exit_status='%(?.%F{green}√.%F{red}?%?)%f'
  local prompt_cursor='%B%F{blue}⮕  %f%b'
  PROMPT=$'\n'"$(prompt_host)"$prompt_pwd' '$prompt_current_branch$'\n'$prompt_cursor

  # local top_left='%~'
  # local top_right="$(git rev-parse --abbrev-ref HEAD 2>/dev/null)"
  # local bottom_left='%# '
  # local bottom_right='%T'

  # PROMPT="$(fill-line "$top_left" "$top_right")"$'\n'$bottom_left
  RPROMPT=$prompt_exit_status
}
autoload -Uz add-zsh-hook
add-zsh-hook precmd set_prompt

# reloads a script or function that was previously defined
function freload() {
  while (( $# )); do
    unfunction $1;
    autoload -U $1;
    shift;
  done
}

# Vim mode
bindkey -v

alias vim="nvim"
alias zshconfig="vim ~/.zshrc"
alias zshreload="source ~/.zshrc"
alias mkdir="mkdir -p"
alias gs="git status"
alias gts='gt submit --no-edit --restack --stack --update-only'
alias gglog="git log --pretty=format:\"%C(yellow)%h%Cred%d\\ %Creset%s%Cblue\\ [%cn]\" --decorate"
alias today="date +'%Y-%m-%d'"
alias ggpull="git pull origin $(git_current_branch)"
alias ggpush="git push origin $(git_current_branch)"
alias test_gglog="git log \
  --max-count=20 --abbrev-commit --decorate --color=always\
  --format=format:'%C(bold green)(%ar)%C(reset) - [%C(dim white)%an%C(reset)] %C(white)%s%C(reset)'"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Use completions installed through brew
if type brew &>/dev/null; then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
fi
autoload -Uz compinit
compinit

# Add Zoxide completions
eval "$(zoxide init zsh)"

# Scripts in zfunc
fpath=( ~/.config/zsh/zfunc "${fpath[@]}" )
fpath=( ~/.config/zsh/zfunc "${fpath[@]}" )

# Autoload everything in zfunc with executable bit
for func in ~/.config/zsh/zfunc/*(N-.x:t); autoload -Uz $func
# Remove any duplicates from the path arrays so they aren't super long
typeset -U path cdpath fpath manpath

# Auto-generated
[[ -x /opt/homebrew/bin/brew ]] && eval $(/opt/homebrew/bin/brew shellenv)

if [ "$TMUX" = "" ]; then tmux new-session -As "$(basename "$PWD")" -c "$PWD"; fi

. $(brew --prefix)/opt/asdf/libexec/asdf.sh

if [[ -x /usr/local/go ]]; then path+=('/usr/local/go/bin'); fi
path+=("$HOME/.config/bin")

source /Users/tristanpotter/.config/op/plugins.sh

# AWS config for DealMaker
export AWS_PROFILE=dealmaker_dev
export SSH_AUTH_SOCK="/Users/tristanpotter/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock"
export PATH="$HOME/.local/bin:$PATH"
