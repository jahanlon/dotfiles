vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set nu")
vim.cmd("set rnu")
vim.g.mapleader = " "

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  
  {'nvim-telescope/telescope.nvim', tag = '0.1.8',
      dependencies = { 'nvim-lua/plenary.nvim' }
  },
  {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"}
}
local opts = {}

require("lazy").setup(plugins, opts)
local tele = require("telescope.builtin")
vim.keymap.set('n', '<C-p>', tele.find_files, {})
vim.keymap.set('n', '<leader>fg', tele.live_grep, {})

local tconfig = require("nvim-treesitter.configs")
tconfig.setup({
  ensure_installed = {"lua"},
  highlight = { enable = true },
  indent = { enabled = true }
})

require("catppuccin").setup()
vim.cmd.colorscheme "catppuccin"
