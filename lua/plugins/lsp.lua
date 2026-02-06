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
  end,
}
