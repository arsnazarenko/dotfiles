local lspconfig = require('lspconfig')
local cmp = require('cmp')
local capabilities = require("cmp_nvim_lsp").default_capabilities()

local servers = { 'clangd', 'rust_analyzer', 'gopls' }
for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
        capabilities = capabilities,
    }
end

cmp.setup {
    mapping = cmp.mapping.preset.insert({
        ['<C-u>'] = cmp.mapping.scroll_docs(-4), -- Up
        ['<C-d>'] = cmp.mapping.scroll_docs(4), -- Down
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        },
    }),
    sources = {
        {name = 'path'},
        {name = 'nvim_lsp', keyword_length = 1},
        {name = 'buffer', keyword_length = 3 },
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
}

vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    update_in_insert = true,
    underline = false,
    severity_sort = false,
    float = {
        focusable = false,
        border = 'rounded',
        source = 'always',
        header = '',
        prefix = '',
    },
})
