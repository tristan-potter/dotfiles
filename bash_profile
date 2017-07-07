# Set architecture flags
export ARCHFLAGS="-arch x86_64"
# Ensure user-installed binaries take precedence
export PATH=/usr/local/bin:$PATH
# Load .bashrc if it exists
test -f ~/.bashrc && source ~/.bashrc

# GOPATH
export GOPATH=$HOME
export PATH=$GOPATH:$PATH

if [[ -f /opt/dev/dev.sh ]]; then source /opt/dev/dev.sh; fi

export PATH="$HOME/.cargo/bin:$PATH"
