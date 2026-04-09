return {
  "neovim/nvim-lspconfig",
  config = function()
    local capabilities = require('cmp_nvim_lsp').default_capabilities()

    -- Configure LSP servers
    vim.lsp.config('ts_ls', {
      capabilities = capabilities,
      root_markers = { 'package.json', 'tsconfig.json', 'jsconfig.json', '.git' },
    })

    vim.lsp.config('ruby_lsp', {
      capabilities = capabilities,
      root_markers = { 'Gemfile', '.git' },
    })

    vim.lsp.config('rust_analyzer', {
      capabilities = capabilities,
      root_markers = { 'Cargo.toml', '.git' },
      settings = {
        ['rust-analyzer'] = {
          diagnostics = {
            enable = false;
          }
        }
      }
    })

    -- LSP keymaps (only active when LSP is attached)
    vim.api.nvim_create_autocmd('LspAttach', {
      callback = function(args)
        local buf = args.buf
        local opts = { buffer = buf }
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', '<Leader>rn', vim.lsp.buf.rename, opts)
        vim.keymap.set('n', '<Leader>ca', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', '<Leader>ds', vim.lsp.buf.document_symbol, opts)
        vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
        vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
      end,
    })

    -- Auto-enable based on filetype
    vim.api.nvim_create_autocmd('FileType', {
      pattern = { 'javascript', 'typescript', 'javascriptreact', 'typescriptreact' },
      callback = function(args)
        vim.lsp.enable('ts_ls', args.buf)
      end,
    })

    vim.api.nvim_create_autocmd('FileType', {
      pattern = 'ruby',
      callback = function(args)
        vim.lsp.enable('ruby_lsp', args.buf)
      end,
    })

    vim.api.nvim_create_autocmd('FileType', {
      pattern = 'rust',
      callback = function(args)
        vim.lsp.enable('rust_analyzer', args.buf)
      end,
    })
  end,
}
