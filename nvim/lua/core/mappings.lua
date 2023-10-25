vim.g.mapleader = ' '

vim.keymap.set('n', '<leader>e', ":Ex<CR>")

vim.keymap.set('n', '<leader>y', "\"+y")
vim.keymap.set('v', '<leader>y', "\"+y")
vim.keymap.set('n', '<leader>Y', "\"+Y")

-- Markown viewer in Firefox
vim.api.nvim_create_user_command("Markdown", "!firefox %:p", {})
