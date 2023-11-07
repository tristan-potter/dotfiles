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
"     Personal vim configuration of Tristan Potter <hi@tristanpotter.dev>


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
source ~/.config/nvim/plugins/editorconfig.vim
source ~/.config/nvim/plugins/fugitive.vim
source ~/.config/nvim/plugins/solarized.vim
source ~/.config/nvim/plugins/quick-scope.vim
source ~/.config/nvim/plugins/heritage.vim
source ~/.config/nvim/plugins/airline.vim
source ~/.config/nvim/plugins/floaterm.vim
source ~/.config/nvim/plugins/fzf.vim
source ~/.config/nvim/plugins/startify.vim
source ~/.config/nvim/plugins/git-gutter.vim
source ~/.config/nvim/plugins/peekaboo.vim
source ~/.config/nvim/plugins/splitjoin.vim
source ~/.config/nvim/plugins/surround.vim
source ~/.config/nvim/plugins/polyglot.vim
source ~/.config/nvim/plugins/writegood.vim
source ~/.config/nvim/plugins/goyo.vim

" TODO set up these two plugins
source ~/.config/nvim/plugins/which-key.vim
source ~/.config/nvim/plugins/coc.vim

call plug#end()

doautocmd User PlugLoaded

"---------------------------------
" Miscellaneous
"---------------------------------
