" This plugin provides a start screen for Vim and Neovim.
"
" It provides dynamically created headers or footers and uses configurable
" lists to show recently used or bookmarked files and persistent sessions. All
" of this can be accessed in a simple to use menu that even allows to open
" multiple entries at once.
"
" Startify doesn't get in your way and works out-of-the-box, but provides many
" options for fine-grained customization.
"
" https://github.com/mhinz/vim-startify

Plug 'mhinz/vim-startify'

" returns all modified files of the current git repo
" `2>/dev/null` makes the command fail quietly, so that when we are not
" in a git repo, the list will be empty
function! s:gitModified()
  let files = systemlist('git ls-files -m 2>/dev/null')
  return map(files, "{'line': v:val, 'path': v:val}")
endfunction

" same as above, but show untracked files, honouring .gitignore
function! s:gitUntracked()
  let files = systemlist('git ls-files -o --exclude-standard 2>/dev/null')
  return map(files, "{'line': v:val, 'path': v:val}")
endfunction

let g:my_custom_header =<< END
 _
| |
| |___      ___ __ ___  _ __
| __\ \ /\ / / '_ ` _ \| '_ \
| |_ \ V  V /| | | | | | |_) |
 \__| \_/\_/ |_| |_| |_| .__/
                       | |
                       |_|
END
let g:startify_padding_left = 3
let g:startify_bookmarks = ['~/.config/nvim/init.vim', '~/.tmux.conf', '~/.zshrc']
let g:startify_change_to_vcs_root = 1

augroup StartifyOverrides
  autocmd!
  autocmd User Startified setlocal cursorline

  " These use Startify methods, so need to run after the plugin loads
  autocmd User PlugLoaded let g:startify_custom_header = startify#center(g:my_custom_header)
  autocmd User PlugLoaded let g:startify_lists = [
  \ { 'type': function('s:gitModified'),  'header': startify#pad(['Modified']) },
  \ { 'type': function('s:gitUntracked'), 'header': startify#pad(['Untracked']) },
  \ { 'type': 'dir', 'header': startify#pad(['Most Recent For: '.getcwd()]) },
  \ { 'type': 'bookmarks', 'header': startify#pad(['Bookmarks']) },
  \ ]
augroup end
