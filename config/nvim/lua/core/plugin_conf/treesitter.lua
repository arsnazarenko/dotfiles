require'nvim-treesitter.configs'.setup {
  ensure_installed = {"go", "rust", "c"},
  
  auto_install = true,

  highlight = {
    enable = true,
    disable = {},
  },
}
