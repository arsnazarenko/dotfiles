require("nvim-treesitter.configs").setup({
      ensure_installed = {
          "c",
          "rust",
          "go",
          "lua",
          "markdown",
          "markdown_inline",
      },
      highlight = { enable = true },
      indent = { enable = true },
      sync_install = false,
})
