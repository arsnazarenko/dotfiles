local lsp = require('lspconfig')
local util = require('lspconfig/util')

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
    root_dir = util.root_pattern('go.work', 'go.mod', '.git'),
    settings = {
      gopls = {
        init_options = {
            usePlaceholders = true,
        },
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
    root_dir = util.root_pattern('Cargo.toml'),
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
    InlayHints = {
      Designators = true,
      Enabled = true,
      ParameterNames = true,
      DeducedTypes = true,
    },
    cmd = { "clangd", "--background-index", "--clang-tidy", "--header-insertion=iwyu", "--inlay-hints" },
    fallbackFlags = { "-std=c++20" },
    filetypes = {'c', 'cpp', 'objc', 'objcpp'},
    root_dir = util.root_pattern('compile_commands.json', 'compile_flags.txt', '.git'),
  }
}

-- Установка и настройка серверов
for server, config in pairs(servers) do
  config.on_attach = on_attach
  config.capabilities = require('cmp_nvim_lsp').default_capabilities()
  lsp[server].setup(config)
end

-- Настройка диагностики
vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = true,
  severity_sort = false,
})

-- enable inlay hist
vim.lsp.inlay_hint.enable(true)

-- Значки для диагностики
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

