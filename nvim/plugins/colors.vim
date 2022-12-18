" https://github.com/tjdevries/colorbuddy.nvim
" Your color buddy for making cool neovim color schemes
Plug 'tjdevries/colorbuddy.nvim'

" https://github.com/amadeus/vim-convert-color-to
" A simple and easy to use plugin to convert color strings to different
" formats.
"
" Main command: `ConvertColorTo [type]`
Plug 'amadeus/vim-convert-color-to'

augroup ColorsOverrides
  autocmd!
  nmap <silent> <leader>cth :ConvertColorTo hex<CR>
augroup end

" Potential Mac System Base Colors
" Name    | Hex     | RGB
" --------|---------|---------------------
" Dark3   | #000000 | rgb(0,   0,   0)
" Dark2   | #161618 | rgb(22,  22,  24)
" Dark1   | #212124 | rgb(33,  33,  36)
" Dark0   | #818181 | rgb(129, 129, 129)
" White   | #ffffff | rgb(255, 255, 255)
" Light0  |         | rgb(0,   0,   0)
" Light1  |         | rgb(0,   0,   0)
" Light2  |         | rgb(0,   0,   0)
" Light3  |         | rgb(0,   0,   0)
" --------|---------|---------------------
" MacOS Accessible Colours Dark
" --------|---------|---------------------
" Red     | #ff6961 | rgb(255, 105, 97)
" Orange  | #ffb340 | rgb(255, 179, 64)
" Yellow  | #ffd426 | rgb(255, 212, 38)
" Green   | #31de4b | rgb(49,  222, 75)
" Mint    | #66d4cf | rgb(102, 212, 207)
" Teal    | #5de6ff | rgb(93,  230, 255)
" Cyan    | #70d7ff | rgb(112, 215, 255)
" Blue    | #409cff | rgb(64,  156, 255)
" Indigo  | #7d7aff | rgb(125, 122, 255)
" Purple  | #da8fff | rgb(218, 143, 255)
" Pink    | #ff6482 | rgb(255, 100, 130)
" Brown   | #b59469 | rgb(181, 148, 105)
" Grey    | #98989d | rgb(152, 152, 157)
