-- mini.pick: use default configuration
local MiniPick = require('mini.pick')
local MiniExtra = require('mini.extra')
MiniPick.setup({
    mappings = {
        choose_marked = '<C-q>',
        mark = '<C-x>',
        mark_all = '<C-a>',
    }
})
MiniExtra.setup({})

-- Old files
vim.keymap.set('n', '<leader>of', function() 
    MiniExtra.pickers.oldfiles({ current_dir = true, preserve_order = true })
end, { desc = 'Pick old files (current dir, recent first)' })

-- Find files
vim.keymap.set('n', '<leader>ff', function()
    MiniPick.builtin.files() 
end, { desc = 'mini.pick: find files' })

-- Fuzzy grep (live)
vim.keymap.set('n', '<leader>fg', function() MiniPick.builtin.grep_live() end, { desc = 'mini.pick: fuzzy grep' })

-- Open buffers
vim.keymap.set('n', '<leader>fb', function() MiniPick.builtin.buffers() end, { desc = 'mini.pick: open buffers' })

-- Resume last picker
vim.keymap.set('n', '<leader>r', function() MiniPick.builtin.resume() end, { desc = 'mini.pick: resume last picker' })
