vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.netrw_altv = 1
vim.g.netrw_banner = 0 		                -- gets rid of the annoying banner for netrw
vim.g.netrw_liststyle = 3

vim.opt.backup = false
vim.opt.compatible = false	
vim.opt.cursorline = true
vim.opt.fileencoding = "utf-8"	            -- encoding set to utf-8
vim.opt.hidden = true
vim.opt.mouse = "a"		
vim.opt.number = true
vim.opt.pumheight = 10					    -- number of items in popup menu
vim.opt.relativenumber = true	            -- turn on relative line numbers
vim.opt.signcolumn = yes
vim.opt.syntax = "on"
vim.opt.wrap = true		                    -- enable text wrapping
vim.opt.breakindent = true
vim.opt.undofile = true -- Save undo history
vim.opt.signcolumn = 'yes'


vim.opt.expandtab = true
vim.opt.ignorecase = true	                -- enable case insensitive searching
vim.opt.shiftwidth = 4
vim.opt.smartcase = true	                -- all searches are case insensitive unless there"s a capital letter
vim.opt.smartindent = true
vim.opt.smarttab = true
vim.opt.tabstop = 4		                    -- tabs=4spaces

vim.opt.hlsearch = true	                    -- disable all highlighted search results
vim.opt.incsearch = true	                -- enable incremental searching
vim.opt.showcmd = true
vim.opt.showmode = false
vim.opt.showmatch = true
vim.opt.completeopt= { "menu", "menuone", "noselect" }
vim.opt.scrolloff = 8					-- scroll page when cursor is 8 lines from top/bottom
vim.opt.sidescrolloff = 8
vim.opt.splitbelow = true				    -- split go below
vim.opt.splitright = true				    -- vertical split to the right
vim.opt.swapfile = false					-- scroll page when cursor is 8 lines from top/bottom

vim.opt.termguicolors = true
vim.cmd("filetype plugin on")			    -- set filetype 
