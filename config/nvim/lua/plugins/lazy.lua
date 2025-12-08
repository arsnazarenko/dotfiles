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
  {"nvim-treesitter/nvim-treesitter", branch = "master", lazy = false, build = ":TSUpdate"},
  {"nvim-telescope/telescope.nvim", tag = "0.1.8", dependencies = { "nvim-lua/plenary.nvim" }},
  {"lewis6991/gitsigns.nvim"},
  {"neovim/nvim-lspconfig"},
  {"hrsh7th/nvim-cmp"},
  {"hrsh7th/cmp-nvim-lsp"},
  {"hrsh7th/cmp-path"},
  {"hrsh7th/cmp-buffer"},
  {'nvim-lualine/lualine.nvim'},
  {"ellisonleao/gruvbox.nvim", priority = 1000, config = true},
  {"navarasu/onedark.nvim", priority = 1000, config = true},
  {"mfussenegger/nvim-jdtls"},
}

-- Setup lazy.nvim
require("lazy").setup(plugins)
