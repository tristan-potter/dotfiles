set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" Keep Plugin commands between vundle#begin/end.

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Dash integration
Plugin 'rizzatti/dash.vim'

"******* LOOK AND FEEL
" solarized
" Plugin 'altercation/vim-colors-solarized'
Plugin 'lifepillar/vim-solarized8' " true colour
" airline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" TODO In the future, may want to transition to 
"   https://github.com/itchyny/lightline.vim
Plugin 'mhinz/vim-startify'
" distraction free writing
Plugin 'junegunn/goyo.vim'

" TMUX
Plugin 'weihanglo/tmuxline.vim'

"******* GIT PLUGINS ********
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rhubarb.git'
" extend fugitive with better branch and commit views
Plugin 'gregsexton/gitv'
" git gutter
Plugin 'airblade/vim-gitgutter'

" ***** CONVINIENCE *******
" easy ctag management for 'go-to-definition' support
Plugin 'ludovicchabant/vim-gutentags'
" personal wiki
Plugin 'vimwiki/vimwiki'
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
" Use editorconfig files if found
Plugin 'editorconfig/editorconfig-vim'
" Show registers when pasting
Plugin 'junegunn/vim-peekaboo'

"****** CODE COMPLETION ********
" On servers, probably want to just use ervandew/supertab since it's
"   more lightweight and doesn't require compilations
" Plugin 'ervandew/supertab'
Plugin 'Valloric/YouCompleteMe'
" Plugin 'SirVer/ultisnips'
" Supercharged autocomplete for html
Plugin 'mattn/emmet-vim'
Plugin 'mattn/webapi-vim'

" ****** PROJECT CONTEXT *******
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
" Use fzf for file search, async!
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plugin 'junegunn/fzf.vim'
" Buffergator (leader-b to display a list of buffers)
Plugin 'jeetsukumaran/vim-buffergator'
" Plugin 'Chiel92/vim-autoformat'

" Check code syntax
Plugin 'w0rp/ale'

" Program support
Plugin 'dgryski/vim-godef'
Plugin 'fatih/vim-go'
Plugin 'vim-ruby/vim-ruby'
" Plugin 'lervag/vimtex'
Plugin 'LaTeX-Box-Team/LaTeX-Box'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'thoughtbot/vim-rspec'
Plugin 'tpope/vim-rails'
Plugin 'rust-lang/rust.vim'
Plugin 'davidbeckingsale/writegood.vim' " English y'all
Plugin 'leafgarland/typescript-vim'
Plugin 'ianks/vim-tsx'

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
" terminal.app on macOS has a problem with the next line
" also maybe alacritty with zsh???
" noremap <C-[> <C-c>
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

" Gutentags
let g:gutentags_ctags_executable_ruby = 'starscope && starscope -e cscope'
let g:gutentags_ctags_executable_javascript = 'starscope && starscope -e cscope'
let g:gutentags_ctags_executable_golang = 'starscope && starscope -e cscope'

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
nnoremap <C-P> :Files<CR>
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
nnoremap <NUL> :Find<CR>
vnoremap <NUL> y:Find<SPACE><C-R>"<CR>

" Search for selection
vnoremap // y/<C-R>"<CR>

"editorconfig 
let g:EditorConfig_exclude_patterns = ['fugitive://.*']

" startify
let g:startify_fortune_use_unicode = 1
let g:startify_padding_left = 3
let g:startify_bookmarks = [ {'a': '~/.vimrc'}, '~/.zshrc' ]
let g:startify_change_to_vcs_root = 1
function! s:filter_header(lines) abort
    let longest_line   = max(map(copy(a:lines), 'strwidth(v:val)'))
    let centered_lines = map(copy(a:lines),
                \ 'repeat(" ", (&columns / 2) - (longest_line / 2)) . v:val')
    return centered_lines
endfunction
let g:startify_custom_header = s:filter_header(startify#fortune#cowsay())
let g:startify_list_order = ['bookmarks', 'dir', 'commands']

" ALE 
let g:ale_sign_column_always = 1
let g:ale_fixers = {}
let g:ale_fixers.javascript = [
            \ 'eslint',
            \ 'remove_trailing_lines'
            \ ]

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
let g:airline_solarized_bg='dark'

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

" vimtex
" let g:vimtex_latexmk_enabled = 0

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

" TODO better mapping for this
" nmap <F8> :TagbarToggle<Cr>

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

set splitbelow              " New window goes below
set splitright              " New windows goes right
set termguicolors           " Enable true color support
set undofile                " Persistent Undo

" Set colours
if !exists("g:syntax_on")
  syntax enable
endif

" set line the cursor is on to be highlighted
set cursorline
set colorcolumn=80 " line end guide

" make comments and HTML attributes italic
" highlight htmlArg cterm=italic

" TrueColor (24-bit) colorscheme
" set Vim-specific sequences for RGB colors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
execute "set t_8f=\e[38;2;%lu;%lu;%lum"
execute "set t_8b=\e[48;2;%lu;%lu;%lum"

" Set the colorscheme to solarized
colorscheme solarized8_dark
" let g:solarized_term_italics = 0
" let g:solorized_old_cursor_style = 1
" let g:solarized_visibility = "high"
" let g:solarized_diffmode = "high"

" Toggle light and dark solarized
" nnoremap  <leader>B :<c-u>exe "colors" (g:colors_name =~# "dark"
"     \ ? substitute(g:colors_name, 'dark', 'light', '')
"     \ : substitute(g:colors_name, 'light', 'dark', '')
"     \ )<cr>

" Break insert mode at punctuation
inoremap . .<c-g>u
inoremap ? ?<c-g>u
inoremap ! !<c-g>u
inoremap , ,<c-g>u
