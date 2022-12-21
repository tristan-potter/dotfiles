" Theme: {{{
" Plugins and configuration related

" https://github.com/amadeus/vim-convert-color-to
" A simple and easy to use plugin to convert color strings to different
" formats.
"
" Main command: `ConvertColorTo [type]`
Plug 'amadeus/vim-convert-color-to'
function! s:ConfigConvertColorTo()
  nmap <silent> <leader>cth :ConvertColorTo hex<CR>
endfunction


" https://github.com/RRethy/nvim-base16
" Neovim plugin for building a sync base16 colorscheme. Includes support for
" Treesitter and LSP highlight groups.
Plug 'RRethy/nvim-base16'
function! s:ConfigBase16()
endfunction

" https://github.com/Yggdroot/indentLine
" vim plugin to display the indention levels with thin vertical lines
Plug 'Yggdroot/indentLine'
function! s:ConfigIndentLine()
endfunction

" https://github.com/RRethy/vim-hexokinase
" hexokinase.vim - (Neo)Vim plugin for asynchronously displaying the colours
" in the file (#rrggbb, #rgb, rgb(a)? functions, hsl(a)? functions, web
" colours, custom patterns)
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
function! s:ConfigHexokinase()
  let g:Hexokinase_highlighters = ['virtual']
endfunction


function! s:ConfigPlugins()
  call s:ConfigConvertColorTo()
  call s:ConfigBase16()
  call s:ConfigHexokinase()
  call s:ConfigIndentLine()

  set background=dark
  " colorscheme themer
  " colorscheme solarized8_high
  colorscheme base16-onedark
endfunction

function! SyntaxGroup()
  return synIDattr(synID(line('.'), col('.'), 1), 'name')
endfunction

augroup ThemeConfigurations
  autocmd!
  autocmd User PlugLoaded ++nested call s:ConfigPlugins()
  command! -nargs=0 SyntaxGroup echo SyntaxGroup()
  " verbose hi <group> to see where the highlight is defined
  " hi link vimLineComment vimCommentTitle
augroup end

" }}}

" Inspo: {{{
"  Ideas for future improvement
" - https://github.com/ayu-theme/ayu-vim : Cool colourscheme and also aethetic
"   images
" }}}

" Gravehard: {{{
"  Where past ideas are being parked
"
" https://github.com/tjdevries/colorbuddy.nvim
" Your color buddy for making cool neovim color schemes
"
" Not using becuase while this is cool, it feels like more complexity than I
" need right now. Instead I'm going with base16 colorschemes, and nvim-base16
" seems like a good way to do that.
" Plug 'tjdevries/colorbuddy.nvim'

" https://github.com/lifepillar/vim-solarized8
"
" Optimized Solarized colorschemes. Best served with true-color terminals!
" Plug 'lifepillar/vim-solarized8'
" }}}
