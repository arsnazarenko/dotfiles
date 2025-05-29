local lspconfig = require('lspconfig')

lspconfig.clangd.setup({
  settings = {
    clangd = {
      InlayHints = {
        Designators = true,
        Enabled = true,
        ParameterNames = true,
        DeducedTypes = true,
      },
      cmd = { "clangd", "--background-index", "--clang-tidy", "--header-insertion=iwyu", "--inlay-hints" },
      fallbackFlags = { "-std=c++20" },
    },
  }
})

lspconfig.rust_analyzer.setup({
    settings = {
        ['rust-analyzer'] = {
            inlayHints = {
                enable = true,
                typeHints = true,
                chainingHints = true,
                parameterHints = true,
                renderColons = true,
                closingBraceHints = {
                  enable = true,
                  minLines = 25,
                },
            },
            imports = {
                granularity = {
                    group = "module",
                },
                prefix = "self",
            },
            cargo = {
                buildScripts = {
                    enable = true,
                },
            },
            checkOnSave = {
                command = 'clippy',
            },
            procMacro = {
                enable = true
            },
            diagnostics = {
                enable = true,
                experimental = {
                    enable = true,
                },
            },
        },
    }
})

lspconfig.gopls.setup({
    settings = {
        gopls = {
            init_options = {
                usePlaceholders = true,
            },
            experimentalPostfixCompletions = true,
            analyses = {
                unusedparams = true,
                shadow = true,
            },
            gofumpt = true,
            staticcheck = true,
            hints = {
                assignVariableTypes = true,
                compositeLiteralFields = true,
                constantValues = true,
                functionTypeParameters = true,
                parameterNames = true,
                rangeVariableTypes = true,
            },
        },
    },
})

-- Global mappings.
vim.keymap.set('n', '<space>d', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts) 
    vim.keymap.set('n', '<space>f', function()
        vim.lsp.buf.format { async = true }
    end, opts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
  end,
})

-- vim.api.nvim_create_autocmd('LspAttach', {
--   desc = 'Enable inlay hints on LSP attach',
--   callback = function(args)
--     local client = vim.lsp.get_client_by_id(args.data.client_id)
--     if client and client.server_capabilities.inlayHintProvider then
--       vim.lsp.inlay_hint.enable(true, { bufnr = args.buf })
--     end
--   end,
-- })


vim.lsp.inlay_hint.enable(true)

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

