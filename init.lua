vim.wo.number = true        -- Enable absolute line numbers

vim.opt.tabstop = 4        -- Number of visual spaces per TAB
vim.opt.shiftwidth = 4     -- Number of spaces to use for each step of (auto)indent
vim.opt.softtabstop = 4    -- Number of spaces a <Tab> counts for while editing
vim.opt.expandtab = true    -- Use spaces instead of tabs
vim.keymap.set('i', '<C-H>', '<C-w>', { noremap = true })

vim.keymap.set('n', 'j', 'gj', { noremap = true })
vim.keymap.set('n', 'k', 'gk', { noremap = true })

vim.keymap.set('v', 'j', 'gj', { noremap = true })
vim.keymap.set('v', 'k', 'gk', { noremap = true })

--vim.g.loaded_matchparen = 1



-- Ensure lazy is in runtime path
-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim and load plugins
require("lazy").setup({
    -- Plugins go here as tables
    -- Example: Hop plugin
    {
    "phaazon/hop.nvim",
    branch = "v2",
    config = function()
      require("hop").setup()
    end
    },
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
    {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = true
    },
    {
    'stevearc/oil.nvim',
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {},
    -- Optional dependencies
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
    -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
    -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
    lazy = false,
    }
})

-- oil
require("oil").setup()
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- place this in one of your configuration file(s)
-- local hop = require('hop')
-- local directions = require('hop.hint').HintDirection
-- vim.keymap.set('', 'f', function()
--   hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = false })
-- end, {remap=true})
-- vim.keymap.set('', 'F', function()
--   hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = false })
-- end, {remap=true})
-- vim.keymap.set('', 't', function()
--   hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })
-- end, {remap=true})
-- vim.keymap.set('', 'T', function()
--   hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })
-- end, {remap=true})

vim.api.nvim_set_keymap("n", "F", ":HopChar2<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "f", ":HopChar1<CR>", { silent = true })

vim.cmd("colorscheme catppuccin-frappe")
