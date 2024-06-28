vim.g.mapleader = ' '

vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")
-- Move highlighted blocks with J and K

-- No search visualisation on Esc
vim.keymap.set('n', '<esc>', ':nohlsearch<CR>', { noremap = true, silent = true })
-- open vim explorer
vim.keymap.set('n', '<leader>e', ":Lex<CR>")

-- copy to out buffer
vim.keymap.set('n', '<leader>y', "\"+y")
vim.keymap.set('v', '<leader>y', "\"+y")
vim.keymap.set('n', '<leader>Y', "\"+Y")

-- Markown viewer in Firefox
vim.api.nvim_create_user_command("Markdown", "!firefox %:p &", {})

arrow_disabled = function () print("Arrows disabled!") end

-- Disable arrows in all modes
vim.keymap.set({'n', 'i', 'v'}, '<up>', arrow_disabled)
vim.keymap.set({'n', 'i', 'v'}, '<down>', arrow_disabled)
vim.keymap.set({'n', 'i', 'v'}, '<left>', arrow_disabled)
vim.keymap.set({'n', 'i', 'v'}, '<right>', arrow_disabled)
