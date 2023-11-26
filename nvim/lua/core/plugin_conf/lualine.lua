require('lualine').setup {
    options = {
        icons_enabled = true,
        theme = 'ayu_dark',
        -- theme = 'dracula'
        component_separators = '|',
        section_separators = '',
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
