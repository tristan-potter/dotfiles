" TODO use this to make my keybindings more accessible
"
" WhichKey is a lua plugin for Neovim 0.5 that displays a popup with possible
" key bindings of the command you started typing.
"
" With the default settings, WhichKey will work out of the box for most builtin
" keybindings, but the real power comes from documenting and organizing your
" own keybindings.
"
" https://github.com/folke/which-key.nvim

Plug 'folke/whick-key.nvim'

augroup which_key_setup
  autocmd!
  autocmd User PlugLoaded call WhichKeySetup()
augroup END

" Include the write good commands and spell check ones!
