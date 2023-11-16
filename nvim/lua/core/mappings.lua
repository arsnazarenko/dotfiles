vim.g.mapleader = ' '

vim.keymap.set('n', '<leader>e', ":Ex<CR>")

vim.keymap.set('n', '<leader>y', "\"+y")
vim.keymap.set('v', '<leader>y', "\"+y")
vim.keymap.set('n', '<leader>Y', "\"+Y")

-- Markown viewer in Firefox
vim.api.nvim_create_user_command("Markdown", "!firefox %:p", {})

-- Disable arrows in all modes
vim.keymap.set({'n', 'i', 'v'}, '<up>', '<nop>')
vim.keymap.set({'n', 'i', 'v'}, '<down>', '<nop>')
vim.keymap.set({'n', 'i', 'v'}, '<left>', '<nop>')
vim.keymap.set({'n', 'i', 'v'}, '<right>', '<nop>')
