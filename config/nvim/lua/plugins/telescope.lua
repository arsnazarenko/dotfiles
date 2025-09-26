local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fs', builtin.lsp_document_symbols, {})
vim.keymap.set('n', '<leader>of', builtin.oldfiles, {})
-- vim.keymap.set('n', '<leader>fr', builtin.lsp_references, {})
-- vim.keymap.set('n', '<leader>fi', builtin.lsp_implementations, {})
-- vim.keymap.set('n', '<leader>fd', builtin.lsp_definitions, {})
-- vim.keymap.set('n', '<leader>rr', builtin.resume, {})
-- vim.keymap.set('n', '<leader>sd', builtin.diagnostics, {})


require('telescope').setup {
    defaults = require('telescope.themes').get_ivy()
}

