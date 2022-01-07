" https://github.com/lifepillar/vim-solarized8
"
" Optimized Solarized colorschemes. Best served with true-color terminals!

Plug 'lifepillar/vim-solarized8'

augroup SolarizedOverrides
  autocmd!
  set background=dark
  autocmd User PlugLoaded ++nested colorscheme solarized8_high
augroup end
