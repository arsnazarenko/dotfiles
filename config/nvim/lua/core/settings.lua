-- Common
vim.cmd("filetype plugin on")
vim.opt.backup = false
vim.opt.compatible = false
vim.opt.cursorline = true
vim.opt.fileencoding = "utf-8"
vim.opt.hidden = true
vim.opt.mouse = "a"
vim.opt.number = true
-- vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"
vim.opt.syntax = "on"
vim.opt.wrap = true
vim.opt.linebreak = true
-- vim.opt.breakindent = true
vim.opt.undofile = false
vim.showcmd = true
vim.showmode = true
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.swapfile = false
vim.opt.colorcolumn = "100"

-- Idents
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.smartindent = true
vim.opt.smarttab = true
vim.opt.tabstop = 4
vim.opt.list = true -- visualize idents

-- Search
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.showmatch = true
vim.opt.completeopt= { "menu", "menuone", "noselect" }

-- Netrw config
vim.g.netrw_altv = 1
vim.g.netrw_banner = 0
-- vim.g.netrw_liststyle = 3

-- Colors 
vim.opt.termguicolors = true
