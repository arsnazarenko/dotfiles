require('lualine').setup {
    options = {
        icons_enabled = true,
       -- theme = 'gruvbox'
        theme = 'dracula'
    },
    sections = {
        lualine_a = {
            {
                'filename',
                path = 1,
            }
        }
    }
}
