Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

function! s:SetupTreesitter()
lua << EOF
-- New nvim-treesitter API: parsers.lua is a plain table, mutate it directly
require('nvim-treesitter.parsers')['vhs'] = {
  install_info = {
    url = 'https://github.com/charmbracelet/tree-sitter-vhs',
    files = { 'src/parser.c' },
    branch = 'main',
  },
}

vim.filetype.add({ extension = { tape = 'tape' } })
vim.treesitter.language.register('vhs', 'tape')

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'tape',
  callback = function(ev)
    vim.treesitter.start(ev.buf, 'vhs')
  end,
})

-- Auto-install the vhs parser if not already present
vim.api.nvim_create_autocmd('VimEnter', {
  once = true,
  callback = function()
    local installed = require('nvim-treesitter.config').get_installed('parsers')
    if not vim.list_contains(installed, 'vhs') then
      require('nvim-treesitter').install({ 'vhs' })
    end
  end,
})
EOF
endfunction

augroup TreesitterSetup
  autocmd!
  autocmd User PlugLoaded call s:SetupTreesitter()
augroup end
