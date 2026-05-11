"
"                       _
"                      | |
"                      | |___      ___ __ ___  _ __
"                      | __\ \ /\ / / '_ ` _ \| '_ \
"                      | |_ \ V  V /| | | | | | |_) |
"                       \__| \_/\_/ |_| |_| |_| .__/
"                                             | |
"                                             |_|
"
"     Personal vim configuration of Tristan Potter <hello@tristanpotter.dev>


"------------------------------------------------------------------------------
" General Settings
"------------------------------------------------------------------------------

syntax on
set nocompatible
set hlsearch
set ignorecase
set smartcase
set hidden
set signcolumn=yes:2
set number
set termguicolors
set list
set listchars=tab:►\ ,trail:•
set scrolloff=8
set clipboard=unnamedplus
set colorcolumn=80
set cursorline
set splitright
set splitbelow
set autoindent
set smartindent
set spellsuggest=15
set linebreak
set expandtab
set smarttab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set shiftround
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=2
set incsearch
set nolazyredraw
set undofile
set number
set relativenumber
set numberwidth=4
set visualbell
set belloff+=ctrlg
set completeopt="menuone,noselect,noinsert,popup,menu,preview"
set noshowcmd

filetype plugin indent on

"--------------------------------
" Key Mappings
"---------------------------------
let mapleader="\<Space>"

" Reload Vim configurations
nnoremap <leader>r :source $MYVIMRC<cr>

map <Leader>ve :edit ~/.config/nvim/init.vim<cr>
nmap <Leader>vr :source ~/.config/nvim/init.vim<cr>

" shortcut to save
nnoremap \\ :w<cr>

" map capitals to their lowercase equivalents, cause my pinky is slow
:command! WQ wq
:command! Wq wq
:command! W w
:command! -bang Q  quit<bang>

" When text is wrapped, move by terminal rows, not lines, unless a count is provided
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

" Don't over-write the register when pasting in visual mode
vnoremap <leader>p "_dP

" Turn on spell check for buffer
nnoremap <leader>s :setlocal spell<cr>

" Maintain the cursor position when yanking a visual selection
" http://ddrscott.github.io/blog/2016/yank-without-jank/
vnoremap y myy`y
vnoremap Y myY`y

" Always make gf open a new file
map gf :e <cfile><CR>
nnoremap <C-W>f <C-W>v:e <cfile><CR>

"Reset visual selection after indenting
vnoremap < <gv
vnoremap > >gv

" Clear search results
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>

" Break insert mode at punctuation to make undo more useful
inoremap . .<c-g>u
inoremap ? ?<c-g>u
inoremap ! !<c-g>u
inoremap , ,<c-g>u

" switch because 0 is easier to hit and ^ is more useful
" commented out in favour of using _ for ^. same behaviour when no count
nnoremap ^ 0
nnoremap 0 ^

"--------------------------------
" Plugins
"---------------------------------

" Install vim-plug if it isn't installed
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

call plug#begin()

source ~/.config/nvim/plugins/commentary.vim
source ~/.config/nvim/plugins/fugitive.vim
source ~/.config/nvim/plugins/eunuch.vim
source ~/.config/nvim/plugins/quick-scope.vim
source ~/.config/nvim/plugins/heritage.vim
source ~/.config/nvim/plugins/floaterm.vim
source ~/.config/nvim/plugins/fzf.vim
source ~/.config/nvim/plugins/startify.vim
source ~/.config/nvim/plugins/splitjoin.vim
source ~/.config/nvim/plugins/surround.vim
" TODO This is causing some problems
" source ~/.config/nvim/plugins/writegood.vim
source ~/.config/nvim/plugins/tabular.vim
source ~/.config/nvim/plugins/copilot.vim

" ***** Display Plugins *****
source ~/.config/nvim/plugins/theme.vim
source ~/.config/nvim/plugins/lualine.lua
source ~/.config/nvim/plugins/coc.vim
source ~/.config/nvim/plugins/languages.vim
source ~/.config/nvim/plugins/treesitter.vim

" Colors, combine this into one
source ~/.config/nvim/plugins/solarized.vim
source ~/.config/nvim/plugins/hexokinase.vim
source ~/.config/nvim/plugins/colors.vim
source ~/.config/nvim/plugins/tint.vim

" Potentially deprecated if which-key will work
source ~/.config/nvim/plugins/peekaboo.vim
" source ~/.config/nvim/plugins/which-key.vim

call plug#end()

doautocmd User PlugLoaded


"---------------------------------
" Filetype Settings
"---------------------------------

augroup filetype_markdown
  " https://codeinthehole.com/tips/writing-markdown-in-vim/
  autocmd!

  " Use Vim's spell checker
  autocmd Filetype markdown setlocal spell

  " Use custom wrapper around MacOS dictionary as keyword look-up
  autocmd Filetype markdown setlocal keywordprg=open-dict

  " Hugo Markdown files can have 'Vim: ' in their file metadata, which Vim
  " treats as a modeline and spits out an error. Hence, we disable
  " `modelines` for Markdown files.
  setlocal nomodeline
augroup end

"---------------------------------
" Miscellaneous
"---------------------------------

function! GenerateHeader(width, word, symbol)
  let l:inserted_word = ' ' . a:word . ' '
  let l:word_width = strlen(l:inserted_word)
  let l:length_before = (a:width - l:word_width) / 2
  let l:hashes_before = repeat(a:symbol, l:length_before)
  let l:hashes_after = repeat(a:symbol, a:width - (l:word_width + l:length_before))
  let l:hash_line = repeat(a:symbol, a:width)
  let l:word_line = l:hashes_before . l:inserted_word . l:hashes_after

  :put =l:hash_line
  :put =l:word_line
  :put =l:hash_line
endfunction

command! -nargs=0 CreateHeader :call GenerateHeader(80, getline("."), split(&commentstring, '%s')[0])

" When the tmux pane loses focus, dim the active split to match inactive
" appearance. tint.nvim handles active vs inactive splits within vim
" automatically via WinEnter/WinLeave. Requires focus-events on in tmux.conf.
" _G._tint_focus_lost is defined in tint.vim where lua<<EOF is reliable.
augroup FocusDim
  autocmd!
  autocmd FocusLost   * lua _G._tint_focus_lost()
  autocmd FocusGained * lua require("tint").untint(vim.api.nvim_get_current_win())
augroup end
