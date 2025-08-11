vim.g.mapleader = ";"

-- vim.wo.number = true        -- Enable absolute line numbers

vim.opt.relativenumber = true

vim.opt.tabstop = 4        -- Number of visual spaces per TAB
vim.opt.shiftwidth = 4     -- Number of spaces to use for each step of (auto)indent
vim.opt.softtabstop = 4    -- Number of spaces a <Tab> counts for while editing
vim.opt.expandtab = true    -- Use spaces instead of tabs
vim.keymap.set('i', '<C-H>', '<C-w>', { noremap = true })
vim.keymap.set('i', 'jj', '<Esc>')
vim.keymap.set("i", "<C-v>", "<C-r>+", { noremap = true })

-- vim.keymap.set('n', 'j', 'gj', { noremap = true })
-- vim.keymap.set('n', 'k', 'gk', { noremap = true })
vim.keymap.set('n', '<leader>wq', ':wq<CR>')
vim.keymap.set('n', '<leader>q', ':q<CR>')
vim.keymap.set('n', '<leader>s', ':w<CR>')
vim.keymap.set('n', '<leader>w', ':w<CR>')
vim.keymap.set("n", "<C-v>", '"+p', { noremap = true })

-- vim.keymap.set('v', 'j', 'gj', { noremap = true })
-- vim.keymap.set('v', 'k', 'gk', { noremap = true })
vim.keymap.set('v', '<C-c>', '"+y', { desc = "Copy to system clipboard" })


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
    {
  "folke/flash.nvim",
  event = "VeryLazy",
  ---@type Flash.Config
  opts = {},
  -- stylua: ignore
  keys = {
    { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
    { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
  },
}
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
vim.keymap.set("n", "'", "<CMD>Oil<CR>", { desc = "Open parent directory" })

vim.cmd("colorscheme catppuccin-frappe")
