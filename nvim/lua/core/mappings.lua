vim.g.mapleader = ' '

-- open vim explorer
vim.keymap.set('n', '<leader>e', ":Lex<CR>")

-- copy to out buffer
vim.keymap.set('n', '<leader>y', "\"+y")
vim.keymap.set('v', '<leader>y', "\"+y")
vim.keymap.set('n', '<leader>Y', "\"+Y")

-- Markown viewer in Firefox
vim.api.nvim_create_user_command("Markdown", "!chromium %:p &", {})

arrow_disabled = function () print("Arrows disabled!") end

-- Disable arrows in all modes
vim.keymap.set({'n', 'i', 'v'}, '<up>', arrow_disabled)
vim.keymap.set({'n', 'i', 'v'}, '<down>', arrow_disabled)
vim.keymap.set({'n', 'i', 'v'}, '<left>', arrow_disabled)
vim.keymap.set({'n', 'i', 'v'}, '<right>', arrow_disabled)
