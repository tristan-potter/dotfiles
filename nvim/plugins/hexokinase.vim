" hexokinase.vim - (Neo)Vim plugin for asynchronously displaying the colours
" in the file (#rrggbb, #rgb, rgb(a)? functions, hsl(a)? functions, web
" colours, custom patterns)

" https://github.com/RRethy/vim-hexokinase
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }

augroup HexokinaseOverrides
  autocmd!
  autocmd User PlugLoaded let g:Hexokinase_highlighters = ['virtual']
augroup end

