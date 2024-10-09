-- easy split generation
vim.keymap.set("n", "<leader>v", ":vsplit<CR>")				        -- space+v creates a veritcal split
vim.keymap.set("n", "<leader>s", ":split<CR>")				            -- space+s creates a horizontal split


-- easy split navigation
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
-- vim.keymap.set("n", "<leader>e", ":25Lex<CR>")			            -- space+e toggles netrw tree view 

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})


-- Visual vim.keymap.sets
vim.keymap.set("v", "<C-s>", ":sort<CR>")							-- Sort highlighted text in visual mode with Control+S
vim.keymap.set("v", "<leader>r", "\"hy:%s/<C-r>h//g<left><left>")   -- Replace all instances of highlighted words 
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")						-- Move current line down
vim.keymap.set("v", "K", ":m '>-2<CR>gv=gv")						-- Move current line up 

-- Resize splits
vim.keymap.set("n", "<C-left>", ":vertical resize +3<CR>")
vim.keymap.set("n", "<C-right>", ":vertical resize -3<CR>")

-- Scrolling revim.keymap.sets
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")


-- No search visualisation on Esc
vim.keymap.set('n', '<Esc>', ':nohlsearch<CR>')

-- copy to out buffer
vim.keymap.set('n', '<leader>y', "\"+y")
vim.keymap.set('v', '<leader>y', "\"+y")
vim.keymap.set('n', '<leader>Y', "\"+Y")

-- Markown viewer in Firefox

arrow_disabled = function () print("Arrows disabled!") end

-- Disable arrows in all modes
vim.keymap.set({'n', 'i', 'v'}, '<up>', arrow_disabled)
vim.keymap.set({'n', 'i', 'v'}, '<down>', arrow_disabled)
vim.keymap.set({'n', 'i', 'v'}, '<left>', arrow_disabled)
vim.keymap.set({'n', 'i', 'v'}, '<right>', arrow_disabled)

vim.api.nvim_create_user_command("Markdown", "!firefox %:p &", {})
