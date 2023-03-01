" Any plugins related to specific languages that don't have language servers
" or COC configurations installed.

" Kitty: Syntax highlighting for Kitty terminal config files.
" https://github.com/fladson/vim-kitty
Plug 'fladson/vim-kitty'

" JsonC: Support json with comments
Plug 'neoclide/jsonc.vim'

" Treesitter: Nvim Treesitter configurations and abstraction layer
" https://github.com/nvim-treesitter/nvim-treesitter
"
" Note that treesitter is not a fully-stable feature, so these may not work
" 100% correctly.
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Treesitter Context: Lightweight alternative to context.vim implemented with
"   nvim-treesitter.
" https://github.com/nvim-treesitter/nvim-treesitter-context
Plug 'nvim-treesitter/nvim-treesitter-context'
function! s:ConfigTreesitterContext()
  " TODO: look into whether the vim named color Grey is modified by Base16
  " colorscheme
  hi TreesitterContextBottom gui=underline guisp=Grey
endfunction

" Sleuth: Heuristically set buffer options
" https://github.com/tpope/vim-sleuth
"
" Automatically adjusts 'shiftwidth' and 'expandtab' heuristically based on
" the current file, or, in the case the current file is new, blank, or
" otherwise insufficient, by looking at other files of the same type in the
" current and parent directories. Modelines and EditorConfig are also
" consulted
Plug 'tpope/vim-sleuth'
function! s:ConfigSleuth()
endfunction

" Editorconfig: Sets indent based on .editorconfig if it exists
" https://github.com/editorconfig/editorconfig-vim
"
" This is an EditorConfig (http://editorconfig.org/) plugin for Vim.
Plug 'editorconfig/editorconfig-vim'
function! s:ConfigEditorconfig()
  let g:EditorConfig_exclude_patterns = ['fugitive://.*']
endfunction

" ------------------------------------------------------------------------------

" Finalize: Call all the plugin configurations after plugins are loaded.
function! s:ConfigPlugins()
  call s:ConfigTreesitterContext()
  call s:ConfigSleuth()
  call s:ConfigEditorconfig()
endfunction

augroup LanguageConfiguration
  autocmd!
  autocmd User PlugLoaded ++nested call s:ConfigPlugins()
augroup end
