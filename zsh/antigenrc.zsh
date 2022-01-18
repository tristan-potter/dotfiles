# load antigen
source $HOME/.config/zsh/antigen.zsh

# oh-my-zsh is useful
antigen use oh-my-zsh

antigen bundle git
antigen bundle common-aliases
antigen bundle tmux
antigen bundle vi-mode
antigen bundle colored-man-pages
antigen bundle history-substring-search
antigen bundle zsh-autosuggestions
antigen bundle z
antigen bundle web-search


# independent plugins
antigen bundle mafredri/zsh-async
antigen bundle sindresorhus/pure
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-history-substring-search ./zsh-history-substring-search.zsh

antigen apply
