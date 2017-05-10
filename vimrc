set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" Keep Plugin commands between vundle#begin/end.

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

"******* LOOK AND FEEL
" solarized
Plugin 'altercation/vim-colors-solarized'
" airline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" TODO In the future, may want to transition to 
"   https://github.com/itchyny/lightline.vim
" TMUX
Plugin 'edkolev/tmuxline.vim'

"******* GIT PLUGINS ********
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" extend fugitive with better branch and commit views
Plugin 'gregsexton/gitv'
" git gutter
Plugin 'airblade/vim-gitgutter'

" ***** CONVINIENCE *******
" easy ctag management for 'go-to-definition' support
"Plugin 'ludovicchabant/vim-gutentags'
" browse tags in the current file
Plugin 'majutsushi/tagbar'
" comment stuff out
Plugin 'tpope/vim-commentary'
" misc functions for plugins
Plugin 'xolox/vim-misc'
" allow easy surrouding
Plugin 'tpope/vim-surround'
" all comma objects to be a real object
Plugin 'austintaylor/vim-commaobject'
"Table mode
Plugin 'dhruvasagar/vim-table-mode'
" Easy movement along a line with f and t
Plugin 'unblevable/quick-scope'

"****** CODE COMPLETION ********
" On servers, probably want to just use ervandew/supertab since it's
"   more lightweight and doesn't require compilations
Plugin 'ervandew/supertab'
Plugin 'Valloric/YouCompleteMe'
Plugin 'SirVer/ultisnips'
" Supercharged autocomplete for html
Plugin 'mattn/emmet-vim'
Plugin 'mattn/webapi-vim'

"******* PROJECT CONTEXT *******
" nerdtree
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
" Ctrl-p fuzzy finder
Plugin 'ctrlpvim/ctrlp.vim'
" Use fzf for file completion, async!
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plugin 'junegunn/fzf.vim'
" Buffergator (leader-b to display a list of buffers)
Plugin 'jeetsukumaran/vim-buffergator'
" Plugin 'Chiel92/vim-autoformat'

" Check code syntax
Plugin 'scrooloose/syntastic'

" Program support
Plugin 'dgryski/vim-godef'
Plugin 'fatih/vim-go'
Plugin 'vim-ruby/vim-ruby'
Plugin 'xuhdev/vim-latex-live-preview'
Plugin 'lervag/vimtex'
Plugin 'pangloss/vim-javascript'
Plugin 'thoughtbot/vim-rspec'
Plugin 'tpope/vim-rails'
Plugin 'rust-lang/rust.vim'
Plugin 'davidbeckingsale/writegood.vim' " English y'all

" All of your Plugins must be added before the following line
call vundle#end()            " required


filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" map capitals, cause my pinky is slow
:command! WQ wq
:command! Wq wq
:command! W w
:command! -bang Q  quit<bang>

" set a map leader for more key combos
let mapleader = '\'

" shortcut to save
nmap <leader>\ :w<cr>

" map ctrl-[ to exit with no checks, and ctrl-c to exit 
noremap <C-[> <C-c>
noremap <C-c> <Esc>

" switch because 0 is easier to hit and ^ is more useful
" commented out in favour of using _ for ^. same behaviour when no count
nnoremap ^ 0
nnoremap 0 ^

" vim-autoformat
" auto run formatting on save
" au BufWrite * :Autoformat

" Buffergator
" https://github.com/jeetsukumaran/vim-buffergator
" We want to be able to use <leader>t for tables. 
" TODO rebind buffer keys
let g:buffergator_suppress_keymaps = 1

" QuickScope options
" Trigger a highlight in the appropriate direction when pressing these keys:
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
" Trigger a highlight only when pressing f and F.
let g:qs_highlight_on_keys = ['f', 'F']
let g:qs_first_occurrence_highlight_color = 155
let g:qs_second_occurrence_highlight_color = 81

" Set Vundle to use ssh
let g:vundle_default_git_proto = 'git'

" fzf
let g:fzf_buffers_jump = 1 " [Buffers] Jump to the existing window if possible
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
let g:fzf_tags_command = 'ctags -R'
" Default fzf layout
let g:fzf_layout = { 'down': '~25%' }
nnoremap <NUL> :Files<CR>


" Add Find command to use rg in fzf
" --column: Show column number
" --line-number: Show line number
" --no-heading: Do not show file headings in results
" --fixed-strings: Search term as a literal string
" --ignore-case: Case insensitive search
" --no-ignore: Do not respect .gitignore, etc...
" --hidden: Search hidden files and folders
" --follow: Follow symlinks
" --glob: Additional conditions for search (in this case ignore everything
"  in the .git/ folder)
" --color: Search color options
command! -bang -nargs=* Find 
            \ call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)


" NerdTree
" autocmd vimenter * NERDTree " sets nerdtree to open on start
map <leader>n :NERDTreeToggle<CR>
let NERDTreeQuitOnOpen=1

" airline
set laststatus=2
set ttimeoutlen=50
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = ' '
let g:airline#extensions#tmuxline#enabled = 0 " we use tmuxline plugin
let g:airline_theme='solarized'

" javascript
let g:javascript_plugin_flow = 1

" you complete me
" compatability https://github.com/SirVer/ultisnips/issues/512
let g:ycm_allow_changing_updatetime = 1         " leave my updatetime alone
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']  
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']

"supertab
let g:SuperTabDefaultCompletionType = '<C-n>'
let g:SuperTabNoCompleteAfter = ['^', ',', '\s']

" UtilSnips
" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

set completeopt="menu" " remove preview from completeopt

"tmuxline
let g:tmuxline_powerline_separators = 0

" set git gutter to update faster
set updatetime=100
let g:gitgutter_sign_column_always = 1

" set ruby to not do expensive syntax highlighting
let ruby_no_expensive=1

" set latex preview 
let g:livepreview_previewer = 'open -a Preview'

" vimtex
let g:vimtex_latexmk_enabled = 0

" Set easytags to use project-dependent tags
" set tags=./.tags;,~/.vimtags

" "Set easytags to compile go-tags
" let g:easytags_languages = {
" 			\   'language': {
" 			\     'go': 'gotags',
" 			\       'fileoutput_opt': '-f',
" 			\       'stdout_opt': '-f-',
" 			\       'recurse_flag': '-R'
" 			\   }
" 			\}

"Tagbar Options
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1

nmap <F8> :TagbarToggle<CR>

"ruby indentation
autocmd FileType ruby setlocal expandtab shiftwidth=2 tabstop=2

" Auto line numbers
set relativenumber
set number

" column length
" this is for readability
set colorcolumn=80

" Improved indentation on newline
set autoindent
set smartindent

" Tab control
set expandtab               " insert spaces for tabs
set smarttab                " tab respects 'tabstop', 'shiftwidth', and 'softtabstop'
set tabstop=4               " the visible width of tabs
set softtabstop=4           " edit as if the tabs are 4 characters wide
set shiftwidth=4            " number of spaces to use for indent and unindent
set shiftround              " round indent to a multiple of 'shiftwidth'
set completeopt+=longest

" code folding settings
set foldmethod=indent       " fold based on indent
set foldnestmax=10          " deepest fold is 10 levels
set nofoldenable            " don't fold by default
set foldlevel=2

" set default yank/copy/delete buffer to be system clipboard
set clipboard=unnamed

" Searching
set ignorecase              " case insensitive searching
set smartcase               " case-sensitive if expresson contains a capital letter
set hlsearch                " highlight search results
set incsearch               " set incremental search, like modern browsers
set nolazyredraw            " don't redraw while executing macros


" Set colours
syntax on                   " switch syntax highlighting on
syntax enable

set t_Co=256                " Explicitly tell vim that the terminal supports 256 colors"
set background=dark
colorscheme solarized       " Set the colorscheme
call togglebg#map("<F5>")
" let g:solarized_termcolors=256 " tells solarized to use 256 termcolours,
" instead of the normal ones

" set line the cursor is on to be highlighted
set cursorline
set colorcolumn=80 " line end guide

" make comments and HTML attributes italic
highlight htmlArg cterm=italic
