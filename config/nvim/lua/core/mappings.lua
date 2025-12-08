-- Mappings
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>e", ":Ex<CR>")

-- move lines
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "J", "mzJ`z")

-- scrolling remappings
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- search next and prev remappings
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- No search visualisation on Esc
vim.keymap.set('n', '<Esc>', ':nohlsearch<CR>')

-- copy to out buffer
vim.keymap.set('n', '<leader>y', "\"+y")
vim.keymap.set('v', '<leader>y', "\"+y")
vim.keymap.set('n', '<leader>Y', "\"+Y")

-- easy split navigation
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })


vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

vim.api.nvim_create_autocmd("LspAttach", {
  desc = 'Run LSP formatting on file save',
  group = vim.api.nvim_create_augroup("lsp", { clear = true }),
  callback = function(args)
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = args.buf,
      callback = function()
        vim.lsp.buf.format {async = false, id = args.data.client_id }
      end,
    })
  end
})

arrow_disabled = function () print("Arrows disabled!") end

-- Disable arrows in all modes
vim.keymap.set({'n', 'i', 'v'}, '<up>', arrow_disabled)
vim.keymap.set({'n', 'i', 'v'}, '<down>', arrow_disabled)
vim.keymap.set({'n', 'i', 'v'}, '<left>', arrow_disabled)
vim.keymap.set({'n', 'i', 'v'}, '<right>', arrow_disabled)

-- Markown viewer in Firefox
vim.api.nvim_create_user_command("Markdown", "!firefox %:p &", {})



local function toggle_quickfix()
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local buf = vim.api.nvim_win_get_buf(win)
    if vim.api.nvim_buf_get_option(buf, "buftype") == "quickfix" then
      vim.cmd("cclose")
      return
    end
  end
  
  if #vim.fn.getqflist() > 0 then
    vim.cmd("copen")
  else
    print("Quickfix list is empty")
  end
end


vim.keymap.set('n', '<M-r>', toggle_quickfix, { noremap = true, silent = true, desc = 'Toggle quickfix list' })
vim.keymap.set('n', '<M-k>', ':cprev<CR>zz', { desc = 'Quickfixlist prev item' })
vim.keymap.set('n', '<M-j>', ':cnext<CR>zz', { desc = 'Quickfixlist next item' })
