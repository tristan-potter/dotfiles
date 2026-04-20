" https://github.com/levouh/tint.nvim
" Dims all highlight groups (syntax, LSP, etc.) in inactive windows/splits.
Plug 'levouh/tint.nvim'

function! s:SetupTint()
lua << EOF
-- Groups excluded from tint's transform; handled via explicit NC definitions
-- in solarized.vim so they exactly match the tmux inactive pane colours.
local ignored = { "Normal", "SignColumn", "LineNr", "CursorLine", "CursorLineNr" }

-- Winhighlight fragment appended to inactive windows for the ignored groups.
local nc_mappings = "SignColumn:SignColumnNC,LineNr:LineNrNC,CursorLineNr:LineNrNC,CursorLine:CursorLineNC"

require("tint").setup({
  transforms = {
    function(r, g, b, _)
      -- Reduce brightness by 28% to match tmux inactive pane colours
      -- (window-style fg=#6e8e8e,bg=#001820 in tmux/theme.conf).
      return math.floor(r * 0.72), math.floor(g * 0.72), math.floor(b * 0.72)
    end
  },
  highlight_ignore_patterns = ignored,
  window_ignore_function = function(winid)
    -- Skip floating windows (FZF popup, floaterm, etc.)
    return vim.api.nvim_win_get_config(winid).relative ~= ""
  end,
})

local extras_group = vim.api.nvim_create_augroup("TintExtras", { clear = true })

-- After tint.nvim's WinLeave hook runs (synchronously), append the NC group
-- mappings for sidebar/cursorline via defer_fn so we run second.
vim.api.nvim_create_autocmd("WinLeave", {
  group = extras_group,
  callback = function()
    local win = vim.api.nvim_get_current_win()
    if vim.api.nvim_win_get_config(win).relative ~= "" then return end
    vim.defer_fn(function()
      if not vim.api.nvim_win_is_valid(win) then return end
      local wh = vim.wo[win].winhighlight
      vim.wo[win].winhighlight = (wh ~= "" and wh .. "," or "") .. nc_mappings
    end, 0)
  end
})

-- Safety net: if tint.untint() doesn't clear our manual additions on WinEnter,
-- remove them so the active window's sidebar/cursorline return to normal.
vim.api.nvim_create_autocmd("WinEnter", {
  group = extras_group,
  callback = function()
    local win = vim.api.nvim_get_current_win()
    vim.defer_fn(function()
      if not vim.api.nvim_win_is_valid(win) then return end
      if vim.wo[win].winhighlight:find("SignColumnNC") then
        vim.wo[win].winhighlight = ""
      end
    end, 0)
  end
})

-- Called by FocusDim on FocusLost. Defined here (not inside a vimscript
-- function body) to avoid lua<<EOF-inside-function reliability issues.
_G._tint_focus_lost = function()
  local win = vim.api.nvim_get_current_win()
  if vim.api.nvim_win_get_config(win).relative ~= "" then return end
  require("tint").tint(win)
  local wh = vim.wo[win].winhighlight
  vim.wo[win].winhighlight = (wh ~= "" and wh .. "," or "") ..
    "Normal:NormalNC," .. nc_mappings
end
EOF
endfunction

augroup TintSetup
  autocmd!
  autocmd User PlugLoaded call s:SetupTint()
augroup end
