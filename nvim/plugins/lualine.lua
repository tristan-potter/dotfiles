-- Plugin for displaying information at the top and bottom of the screen
--
-- https://github.com/nvim-lualine/lualine.nvim

-- Plugin for the statusline

local Plug = vim.fn['plug#']

Plug 'nvim-lualine/lualine.nvim'

-- Providers pretty icons and colours
-- Plug 'nvim-tree/nvim-web-devicons'

local group = vim.api.nvim_create_augroup('LualineConfigs', {clear = true})

vim.api.nvim_create_autocmd("User", {
  pattern = "PlugLoaded", 
  nested = true,
  group = group,
  callback = function() 
    require('lualine').setup {
      options = {
        -- requires icons provider like the one commented out above
        icons_enabled = false,
        -- Use theme onedark or base16
        theme = 'onedark',
        component_separators = { left = ' ', right = ' '},
        section_separators = { left = ' ', right = ' '},
        disabled_filetypes = {
          statusline = {},
          winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
          statusline = 1000,
          tabline = 1000,
          winbar = 1000,
        }
      },
      sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff', 'diagnostics'},
        lualine_c = {'filename'},
        lualine_x = {'filetype'},
        lualine_y = {},
        lualine_z = {'location'}
      },
      inactive_sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff', 'diagnostics'},
        lualine_c = {'filename'},
        lualine_x = {'filetype'},
        lualine_y = {},
        lualine_z = {'location'}
      },
      tabline = {
        lualine_a = {},
        lualine_b = {'buffers'},
      },
      winbar = {},
      inactive_winbar = {},
      extensions = {}
    }
  end
})

