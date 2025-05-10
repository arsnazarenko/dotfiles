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

local plugins = {
    -- Colorschemes and line format
    {"folke/tokyonight.nvim", lazy = false, priority = 1000 },
    "nvim-lualine/lualine.nvim",

    -- Useful plugins
    "tpope/vim-sleuth",

    -- telescope
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope.nvim", tag = "0.1.8" },

    -- lsp configuration
    'neovim/nvim-lspconfig', 
    {'MysticalDevil/inlay-hints.nvim', event = "LspAttach", dependencies = { "neovim/nvim-lspconfig" } },


    -- lsp snippets
    'hrsh7th/nvim-cmp',         -- Autocompletion plugin
    'hrsh7th/cmp-nvim-lsp',     -- LSP source for nvim-cmp
    'hrsh7th/cmp-buffer',       -- Snippets for current buffer
    'hrsh7th/cmp-path',         -- Snippets for path
    'saadparwaiz1/cmp_luasnip', -- Snippets source for nvim-cmp
    {"L3MON4D3/LuaSnip", dependencies = { "rafamadriz/friendly-snippets" } },
    {"nvim-treesitter/nvim-treesitter", build = {":TSUpdate"} },

    -- Git signs
    'lewis6991/gitsigns.nvim',
}

-- Setup lazy.nvim
require("lazy").setup(plugins)
