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
    'nvim-lualine/lualine.nvim', -- Lualine
    
    -- autocompletion 
    'neovim/nvim-lspconfig', -- Collection of configurations for built-in LSP client
    
    'hrsh7th/nvim-cmp', -- Autocompletion plugin
    'hrsh7th/cmp-nvim-lsp', -- LSP source for nvim-cmp
    'hrsh7th/cmp-buffer', -- Snippets for current buffer
    'hrsh7th/cmp-path', -- Snippets for path
    'saadparwaiz1/cmp_luasnip', -- Snippets source for nvim-cmp
    {"L3MON4D3/LuaSnip", dependencies = { "rafamadriz/friendly-snippets" } },
    {'ellisonleao/gruvbox.nvim', priority = 1000 },
    {'dracula/vim', priority = 1000 },
    {'nvim-telescope/telescope.nvim', tag = '0.1.2', dependencies = { 'nvim-lua/plenary.nvim' } },

}

require("lazy").setup(plugins)
