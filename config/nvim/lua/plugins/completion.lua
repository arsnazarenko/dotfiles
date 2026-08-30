require("blink.cmp").setup({
    keymap = { 
        preset = 'default',
        ['<CR>'] = { 'select_and_accept', 'fallback' },
        ['<C-n>'] = { 'show', 'select_next', 'fallback' },
        ['<C-p>'] = { 'select_prev', 'fallback' },
    },

    appearance = {
        -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
        -- Adjusts spacing to ensure icons are aligned
        -- nerd_font_variant = "mono",
        use_nvim_cmp_as_default = true,
    },

    -- (Default) Only show the documentation popup when manually triggered
    completion = { 
        documentation = { auto_show = true },
        list = {
            selection = { preselect = true, auto_insert = false }
        },
        menu = {
            -- draw = {
            --     -- Remove "kind_icon" from this list to disable icons
            --     columns = { { "label", "label_description", gap = 1 } },
            -- },
        },
    },

    -- Default list of enabled providers defined so that you can extend it
    -- elsewhere in your config, without redefining it, due to `opts_extend`
    sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
    },

    -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
    -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
    -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
    --
    -- See the fuzzy documentation for more information
    fuzzy = { implementation = "prefer_rust_with_warning" }
})
