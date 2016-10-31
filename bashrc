# pip should only run if there is a virtualenv currently activated
export PIP_REQUIRE_VIRTUALENV=true

# use gpip to install global
gpip(){
   PIP_REQUIRE_VIRTUALENV="" pip "$@"
}

# load dev, but only if present and the shell is interactive
if [[ -f /opt/dev/dev.sh ]] && [[ $- == *i* ]]; then
  source /opt/dev/dev.sh
fi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
