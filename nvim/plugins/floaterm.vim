" Use (neo)vim terminal in the floating/popup window.
" https://github.com/voldikss/vim-floaterm

Plug 'voldikss/vim-floaterm'

nnoremap <leader>ft :FloatermToggle<CR>

let g:floaterm_gitcommit='floaterm'
let g:floaterm_autoinsert=1
let g:floaterm_width=0.8
let g:floaterm_height=0.8
let g:floaterm_wintitle=0
let g:floaterm_autoclose=1

augroup FloatermCustomisations
    autocmd!
    autocmd ColorScheme * highlight FloatermBorder guibg=none
augroup END
