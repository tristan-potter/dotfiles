" This plugin is used for connecting to language servers for completion,
" linting etc. It is also used to get errors and display them on the same
" line!

Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Use `CocList marketplace` to search for extensions
let g:coc_global_extensions = [
      \'coc-json',
      \'coc-marketplace',
      \'coc-git',
      \'coc-tsserver',
      \'coc-css',
      \'coc-prettier',
      \'coc-solargraph',
      \'coc-eslint',
      \'coc-html',
      \'coc-vimlsp',
      \]

" Set coc_setting.json as jsonc so comments work
augroup coc_config_ft
  au!
  autocmd BufNewFile,BufRead coc_settings.json set syntax=jsonc
  autocmd BufNewFile,BufRead coc_settings.json set filetype=jsonc
augroup END

" Prettier
command! -nargs=0 Prettier :CocCommand prettier.forceFormatDocument
command! -nargs=0 CocMarketplace :CocList marketplace

" go to definition in vertical split
nmap <silent> gd :call CocAction('jumpDefinition', 'vsplit')<CR>
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nmap <silent> <leader>gr :CocCommand document.renameCurrentWord<CR>
nmap <silent> <leader>gf <Plug>(coc-refactor)

" completion list pick previous and next options
inoremap <silent><expr> <C-j> coc#pum#visible() ? coc#pum#next(1) : "\<C-j>"
inoremap <silent><expr> <C-k> coc#pum#visible() ? coc#pum#prev(1) : "\<C-k>"

" Completion use tab
inoremap <silent><expr> <Tab> coc#pum#visible() ? coc#pum#confirm() : "\<Tab>"

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)
