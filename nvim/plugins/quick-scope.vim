" https://github.com/unblevable/quick-scope
"
" An always-on highlight for a unique character in every word on a line to
" help you use f, F and family.
"
" This plugin should help you get to any word on a line in two or three
" keystrokes with Vim's built-in f<char> (which moves your cursor to <char>).

Plug 'unblevable/quick-scope'

" Trigger a highlight in the appropriate direction when pressing these keys:
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
" Trigger a highlight only when pressing f and F.
let g:qs_highlight_on_keys = ['f', 'F']
