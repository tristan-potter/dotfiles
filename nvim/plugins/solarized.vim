" https://github.com/lifepillar/vim-solarized8
"
" Optimized Solarized colorschemes. Best served with true-color terminals!

Plug 'lifepillar/vim-solarized8'

augroup SolarizedOverrides
  autocmd!
  set background=dark
  autocmd User PlugLoaded ++nested colorscheme solarized8_high
  " Inactive window colours to match tmux window-style (theme.conf).
  " Registered here so these fire when the colorscheme loads.
  autocmd ColorScheme * highlight NormalNC     guibg=#001820 guifg=#6e8e8e
  autocmd ColorScheme * highlight SignColumnNC guibg=#001820
  autocmd ColorScheme * highlight LineNrNC     guibg=#001820 guifg=#4a6868
  autocmd ColorScheme * highlight CursorLineNC guibg=#001820
  " Give floaterm's border the same colour as tmux pane borders.
  " Overrides FloatermCustomisations in floaterm.vim (registered after it).
  autocmd ColorScheme * highlight FloatermBorder guibg=none guifg=#006388
augroup end
