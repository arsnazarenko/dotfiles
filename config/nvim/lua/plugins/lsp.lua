-- Общие настройки LSP
local on_attach = function(client, bufnr)
  -- Включить поддержку format-on-save для соответствующих серверов
  client.server_capabilities.documentFormattingProvider = true

  -- Настройка сочетаний клавиш
  local opts = { buffer = bufnr, silent = true }

  -- Навигация
  vim.keymap.set('n', '<leader>fd', vim.lsp.buf.definition, opts) -- Go to definition
  vim.keymap.set('n', '<leader>fr', vim.lsp.buf.references, opts) -- Go to references
  vim.keymap.set('n', '<leader>fi', vim.lsp.buf.implementation, opts) -- Go to implementation
  vim.keymap.set('n', '<leader>fD', vim.lsp.buf.declaration, opts) -- Go to declaration
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts) -- Show documentation

  -- Работа с кодом
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts) -- Code actions
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts) -- Rename symbol
  vim.keymap.set('n', '<leader>f', function() vim.lsp.buf.format { async = true } end, opts) -- Format code

  -- Диагностика
  vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts) -- Previous diagnostic
  vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts) -- Next diagnostic
  vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, opts) -- Show diagnostic in float window
end

-- Настройки серверов LSP
local servers = {
  -- Golang
  gopls = {
    cmd = {'gopls'},
    filetypes = {'go', 'gomod', 'gowork', 'gotmpl'},
    root_markers = {'go.work', 'go.mod', '.git'},
    settings = {
      gopls = {
        usePlaceholders = true,
        experimentalPostfixCompletions = true,
        completeUnimported = true,
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
      }
    }
  },

  -- Rust
  rust_analyzer = {
    cmd = {'rust-analyzer'},
    filetypes = {'rust'},
    root_markers = {'Cargo.toml'},
    settings = {
      ['rust-analyzer'] = {
        procMacro = {
            enable = true
        },
        cargo = {
          allFeatures = true,
        },
        checkOnSave = true,
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
      }
    }
  },

  -- C/C++
  clangd = {
    cmd = {
        "clangd",
        "--background-index",
        "--clang-tidy",
        "--header-insertion=iwyu",
        "--suggest-missing-includes",
        "--completion-style=detailed",
        "--inlay-hints",
    },
    filetypes = {'c', 'cpp', 'objc', 'objcpp'},
    root_markers = {'compile_commands.json', 'compile_flags.txt', '.git'},
    single_file_support = true,
  }
}

-- Установка и настройка серверов
for server, config in pairs(servers) do
  config.on_attach = on_attach
  config.capabilities = require('cmp_nvim_lsp').default_capabilities()
  vim.lsp.config(server, config)
  vim.lsp.enable(server)
end
-- Настройка диагностики
local signs = {
  [vim.diagnostic.severity.ERROR] = " ",
  [vim.diagnostic.severity.WARN] = " ",
  [vim.diagnostic.severity.HINT] = " ",
  [vim.diagnostic.severity.INFO] = " "
}

vim.diagnostic.config({
  virtual_text = true,
  signs = {
      text = signs,
  },
  underline = true,
  update_in_insert = true,
  severity_sort = false,
})

-- enable inlay hist
vim.lsp.inlay_hint.enable(true)

