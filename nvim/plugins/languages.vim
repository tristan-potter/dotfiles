" Any plugins related to specific languages that don't have language servers
" or COC configurations installed.

" Kitty: Syntax highlighting for Kitty terminal config files.
" https://github.com/fladson/vim-kitty
Plug 'fladson/vim-kitty'

" Mustache Handlebars: I can't get the coc-html plugin to correctly handle
" handlebars
" https://github.com/mustache/vim-mustache-handlebars
Plug 'mustache/vim-mustache-handlebars'

" Markdown: Extra markdown functionality
" Depends on the godlygeek/tabular plugin
" https://github.com/preservim/vim-markdown
Plug 'preservim/vim-markdown'
function! s:ConfigMarkdown()
  " Enable folding.
  let g:vim_markdown_folding_disabled = 0

  " Fold heading in with the contents.
  let g:vim_markdown_folding_style_pythonic = 1

  " Don't use the shipped key bindings.
  let g:vim_markdown_no_default_key_mappings = 1

  " Autoshrink TOCs.
  let g:vim_markdown_toc_autofit = 1

  " Indentation for new lists. We don't insert bullets as it doesn't play
  " nicely with `gq` formatting. It relies on a hack of treating bullets
  " as comment characters.
  " See https://github.com/plasticboy/vim-markdown/issues/232
  let g:vim_markdown_new_list_item_indent = 0
  let g:vim_markdown_auto_insert_bullets = 0

  " Filetype names and aliases for fenced code blocks.
  let g:vim_markdown_fenced_languages = ['php', 'py=python', 'js=javascript', 'bash=sh', 'viml=vim']

  " Highlight front matter (useful for Hugo posts).
  let g:vim_markdown_toml_frontmatter = 1
  let g:vim_markdown_json_frontmatter = 1
  let g:vim_markdown_frontmatter = 1

  " Format strike-through text (wrapped in `~~`).
  let g:vim_markdown_strikethrough = 1
endfunction

" JsonC: Support json with comments
Plug 'neoclide/jsonc.vim'

" Treesitter: Nvim Treesitter configurations and abstraction layer
" https://github.com/nvim-treesitter/nvim-treesitter
"
" Note that treesitter is not a fully-stable feature, so these may not work
" 100% correctly.
" Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Treesitter Context: Lightweight alternative to context.vim implemented with
"   nvim-treesitter.
" https://github.com/nvim-treesitter/nvim-treesitter-context
" Plug 'nvim-treesitter/nvim-treesitter-context'
" function! s:ConfigTreesitterContext()
"   " TODO: look into whether the vim named color Grey is modified by Base16
"   " colorscheme
"   hi TreesitterContextBottom gui=underline guisp=Grey
" endfunction

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
  " call s:ConfigTreesitterContext()
  call s:ConfigSleuth()
  call s:ConfigEditorconfig()
  call s:ConfigMarkdown()
endfunction

augroup LanguageConfiguration
  autocmd!
  autocmd User PlugLoaded ++nested call s:ConfigPlugins()
augroup end
