" fzf is a general-purpose command-line fuzzy finder.
" It's an interactive Unix filter for command-line that can be used with any
" list; files, command history, processes, hostnames, bookmarks, git commits,
" etc.
"
" https://github.com/junegunn/fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'stsewd/fzf-checkout.vim'

let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.3, 'yoffset':0.9, 'xoffset': 0.5 } }
let g:fzf_buffers_jump = 1
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

let $FZF_DEFAULT_OPTS = '--layout=reverse --info=inline'

nnoremap <C-P> :Files<CR>
nmap <leader>f :Files<cr>
nmap <leader>F :AllFiles<cr>
nmap <leader>b :Buffers<cr>
nmap \b :Buffers<cr>
nmap <leader>h :History<cr>
nmap <leader>/ :Rg<cr>
nmap <leader>gb :GBranches<cr>
